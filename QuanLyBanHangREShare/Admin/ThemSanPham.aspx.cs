using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Drawing;

namespace QuanLyBanHangREShare.Admin
{
    public partial class ThemSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAlert();
            }
        }
        protected void LoadAlert()
        {
            if (Session["AlertMessage"] != null && Session["AlertType"] != null)
            {
                string alertMessage = Session["AlertMessage"].ToString();
                string alertType = Session["AlertType"].ToString();

                ClientScript.RegisterStartupScript(this.GetType(), "alertType", $"showAlert('{alertMessage}');", true);

                Session.Remove("AlertMessage");
                Session.Remove("AlertType");
            }
        }
        protected void butAdd_Click(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["ConnectionStringREShare"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            SqlDataAdapter adapt = new SqlDataAdapter();
            adapt.SelectCommand = new SqlCommand("SELECT * FROM SANPHAM", con);
            DataTable dt = new DataTable();
            adapt.Fill(dt);
            string strFileUpload = "";
            try
            {
                if (upHinh.HasFile)
                {
                    strFileUpload = "~/img/" + upHinh.FileName;
                    string path = MapPath("/img/") + upHinh.FileName;
                    upHinh.PostedFile.SaveAs(path);
                }
                adapt.InsertCommand = new SqlCommand("INSERT INTO SANPHAM VALUES (@MaSP, " +
                    "@TenSP,@MaLoai,@GIABAN,@MaNCC, @MOTASP, @HINHANH)", con);
                adapt.InsertCommand.Parameters.AddWithValue("@MaSP", txtMaSP.Text);
                adapt.InsertCommand.Parameters.AddWithValue("@TenSP", txtTenSP.Text);
                adapt.InsertCommand.Parameters.AddWithValue("@MaLoai", Convert.ToString(drpLoai.SelectedValue));
                adapt.InsertCommand.Parameters.AddWithValue("@GIABAN", Convert.ToDouble(txtGIABAN.Text));
                adapt.InsertCommand.Parameters.AddWithValue("@MaNCC", Convert.ToString(drpNCC.SelectedValue));
                adapt.InsertCommand.Parameters.AddWithValue("@MOTASP", txtMotaSP.Text);
                adapt.InsertCommand.Parameters.AddWithValue("@HINHANH", strFileUpload);

                DataRow row = dt.NewRow();
                row["MASP"] = "@MaSP";
                row["TENSP"] = "@TenSP";
                row["MOTASP"] = "@MOTASP";
                row["GIABAN"] = Convert.ToDouble(txtGIABAN.Text);
                row["MALOAI"] = Convert.ToString(drpLoai.SelectedValue);
                row["MANCC"] = Convert.ToString(drpNCC.SelectedValue);
                row["HINHANH"] = "@HINHANH";
                dt.Rows.Add(row);
                adapt.Update(dt);

                lblStatus.Text = "Thêm thành công!";
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.Message;
            }
            Session["AlertMessage"] = "Thêm thành công";
            Session["AlertType"] = "showAlert";
            UpdatePage();
        }
        protected void UpdatePage()
        {
            Response.Redirect("~/Admin/ThemSanPham.aspx");
        }
        protected void butCancel_Click(object sender, EventArgs e)
        {
            txtTenSP.Text=txtMaSP.Text=txtGIABAN.Text=" ";
            lblStatus.Text = "";
        }

        protected void drpLoai_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Kết nối đến cơ sở dữ liệu
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringREShare"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Mở kết nối
                connection.Open();

                // Truy vấn để lấy mã loại sản phẩm cao nhất
                string query = "SELECT MAX(MaSP) FROM SanPham WHERE MaLoai = @MaLoai";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@MaLoai", drpLoai.SelectedValue);

                string currentMaSP = (string)command.ExecuteScalar();

                // Kiểm tra xem có giá trị nào được trả về không
                if (!string.IsNullOrEmpty(currentMaSP))
                {
                    // Tách số từ MaDH hiện tại và tăng giá trị lên 1
                    string magoc = currentMaSP.Substring(0,2); //Lấy 2 ký tự đầu
                    string numberPart = currentMaSP.Substring(2); // Lấy phần số sau 2 ký tự đầu
                    int number = int.Parse(numberPart);
                    number++;

                    // Tạo chuỗi mới MaDH
                    txtMaSP.Text=magoc + number.ToString("00");
                }
                connection.Close();
            }
        }

       
    }
}