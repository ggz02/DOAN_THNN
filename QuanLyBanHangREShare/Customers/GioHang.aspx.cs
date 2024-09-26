using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyBanHangREShare
{
    public partial class GioHang : System.Web.UI.Page
    {
        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dnND"] == null)
            {
                
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadAlert();
                LoadData();
            }
        }

        protected void LoadAlert()
        {
            if (Session["AlertMessage"] != null && Session["AlertType"] != null)
            {
                string alertMessage = Session["AlertMessage"].ToString();
                string alertType = Session["AlertType"].ToString();

                ClientScript.RegisterStartupScript(this.GetType(), 
                    alertType, alertType+$"('{alertMessage}');", true);

                Session.Remove("AlertMessage");
                Session.Remove("AlertType");
            }
        }
        protected void LoadData()
        {   
            if (Session["GioHang"] ==null)
            {
                btn_hisProduct_emty.Visible = true;
                btnhisproduct.Visible = false;
                lblTongTien.Visible = false;
                btndathang.Visible = false;
                btn_tieptucmuahang.Visible = false;

                imgEmptcart.Visible = true;
                lbl_emptyCart.Visible=true;

            }
            else
            {
                imgEmptcart.Visible=false;
                lbl_emptyCart.Visible = false;
                //tạo và set kích thước cho gridview
                dt = (DataTable)Session["GioHang"];
                dgvGiohang.DataSource = dt;
                dgvGiohang.DataBind();
                dgvGiohang.Columns[2].ControlStyle.Width = 150;
                dgvGiohang.Columns[3].ControlStyle.Width = 80;
                dgvGiohang.Columns[4].ControlStyle.Width = 80;
                dgvGiohang.Columns[4].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                dgvGiohang.Columns[5].ControlStyle.Width = 80;
                dgvGiohang.Columns[5].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                //dgvGiohang.Columns[6].ControlStyle.Width = 100;
                //dgvGiohang.Columns[6].ItemStyle.HorizontalAlign = HorizontalAlign.Center;

                btn_tieptucmuahang.Visible = true;
                btn_datngay.Visible = false;
                btn_hisProduct_emty.Visible=false;
                if (dgvGiohang.Rows.Count >0)
                {
                    double tong = TinhTongTien(dt);
                    Session["TONG"] = tong;     // lưu để truyền qua trang DonHang.aspx
                    lblTongTien.Text = "Tổng tiền trên giỏ hàng là: " + 
                        String.Format("{0:0,000} VNĐ", tong);
                }
                else
                {
                    imgEmptcart.Visible = true;
                    
                    lbl_emptyCart.Visible = true;
                    btnhisproduct.Visible = false;
                    lblTongTien.Visible = false;

                    btn_datngay.Visible = true;
                    btn_tieptucmuahang.Visible=false;
                    btndathang.Visible= false;
                    btn_hisProduct_emty.Visible = true;
                }
            }
        }

        //event cập nhật
        //protected void grdGioHang_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    dt = (DataTable)Session["GioHang"];
        //    GridViewRow row = dgvGiohang.Rows[e.RowIndex];
        //    TextBox txtSoluong = (TextBox)(row.Cells[5].Controls[0]);
        //    int Soluong = Convert.ToInt32(txtSoluong.Text);

        //    string giaString = dt.Rows[row.DataItemIndex]["Gia"].ToString();
        //    giaString = giaString.Replace(" VNĐ", "").Replace(",", "");

        //    double Gia, TongTien=0;
        //    if (double.TryParse(giaString, out Gia))
        //    {

        //        TongTien = Gia * Soluong;
        //    }

        //    dt.Rows[row.DataItemIndex]["SoLuong"] = txtSoluong.Text;
        //    dt.Rows[row.DataItemIndex]["TongTien"] = TongTien.ToString("0,000") + " VNĐ";

        //    //Reset the edit index.
        //    dgvGiohang.EditIndex = -1;
        //    Session["GioHang"] = dt;

        //    //hiển thị thông báo
        //    Session["AlertMessage"] = "Cập nhật thành công";
        //    Session["AlertType"] = "showAlert";
        //    UpdatePage();

        //    LoadData();
        //}
        //protected void grdGioHang_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    dgvGiohang.EditIndex = e.NewEditIndex;
        //    LoadData();
        //}

        protected void grdGioHang_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (Session["GioHang"] == null || dgvGiohang.Rows.Count < 0)
            {
                imgEmptcart.Visible = true;
                lbl_emptyCart.Visible = true;
            }
            else
            {
                dt = (DataTable)Session["GioHang"];

                if (dt.Rows.Count > 0)
                {
                    GridViewRow row = dgvGiohang.Rows[e.RowIndex];
                    dt.Rows[row.DataItemIndex].Delete();
                    dt.AcceptChanges(); // Cập nhật thay đổi trong DataTable

                    Session["GioHang"] = dt;

                    //hiển thị thông báo
                    Session["AlertMessage"] = "Xóa thành công";
                    Session["AlertType"] = "showAlert";
                    //cập lại trang vì label hiển thị số lượng trong giỏ hàng vẫn tồn tại
                    UpdatePage();
                }
                LoadData();
            }
        }
        protected void UpdatePage()
        {
            Response.Redirect("~/Customers/GioHang.aspx");
        }

        //event edit
        //protected void grdGioHang_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    dgvGiohang.EditIndex = -1;
        //    LoadData();
        //}

        //Hàm tính tổng tiền
        protected double TinhTongTien(DataTable dt)
        {
            if (dt == null)
                return 0;

            double sum = 0;
            foreach (DataRow row in dt.Rows)
            {
                string tongTienString = 
                    row["TongTien"].ToString().Replace(" VNĐ", "").Replace(",", "");
                double tongTien;
                if (double.TryParse(tongTienString, out tongTien))
                {
                    sum += tongTien;
                }
            }
            return sum;
        }

        protected void btndathang_Click(object sender, EventArgs e)
        {
            if (Session["GioHang"] == null || (dgvGiohang.Rows.Count == 0 
                && Session["GioHang"] != null 
                && ((DataTable)Session["GioHang"]).Rows.Count == 0))
            {
                Session["AlertMessage"] = "Vui lòng chọn sản phẩm";
                Session["AlertType"] = "showAlertInfo";
                UpdatePage();
            }
            else
            {
                Response.Redirect("~/Customers/DonHang.aspx");
            }
        }
    }
}