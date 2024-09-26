using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyBanHangREShare.Admin
{
    public partial class ChiTietSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grdMatHang_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            FileUpload fileUpload = grdMatHang.Rows[e.RowIndex].FindControl("FileUpload1") as FileUpload;

            if (fileUpload != null && fileUpload.HasFile)
            {
                try
                {
                    // Lưu file ảnh vào thư mục trên server
                    string fileName = Path.GetFileName(fileUpload.FileName);
                    string filePath = "~/img/" + fileName;
                    fileUpload.SaveAs(Server.MapPath(filePath));

                    string maSP = grdMatHang.DataKeys[e.RowIndex].Value.ToString();

                    // Cập nhật dữ liệu vào cơ sở dữ liệu
                    string updateQuery = "UPDATE SanPham SET HinhAnh = @HinhAnh WHERE MaSP = @MaSP";

                    string conStr = WebConfigurationManager.ConnectionStrings["ConnectionStringREShare"].ConnectionString;
                    SqlConnection conn = new SqlConnection(conStr);
                    
                    {
                        using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                        {

                            cmd.Parameters.AddWithValue("@HinhAnh", filePath);
                            cmd.Parameters.AddWithValue("@MaSP", maSP);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    // Refresh GridView
                    grdMatHang.EditIndex = -1;
                    grdMatHang.DataBind(); // Gọi hàm để load lại dữ liệu mới
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Cập nhật sản phẩm thành công');", true);

                }
                catch (System.Exception ex)
                {
                    string errorMessage = "Gặp lỗi cập nhật sản phẩm: " + ex.Message;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "errorAlert", "showAlert('" + errorMessage + "');", true);
                }
            }

            GridViewRow row = grdMatHang.Rows[e.RowIndex];
            string maSP = grdMatHang.DataKeys[e.RowIndex].Values["MaSP"].ToString();
            DropDownList ddlNCC = (DropDownList)row.FindControl("DropDownList1");

            // Thiết lập giá trị cho UpdateCommand
            srcMatHang.UpdateParameters["MaNCC"].DefaultValue = ddlNCC.SelectedValue;
            srcMatHang.UpdateParameters["MaSP"].DefaultValue = maSP;

            // Thực hiện cập nhật
            srcMatHang.Update();

            // Cập nhật lại GridView sau khi cập nhật dữ liệu
            grdMatHang.DataBind();
        }
    }
}