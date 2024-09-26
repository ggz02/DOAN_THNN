using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyBanHangREShare
{
    public partial class Login : System.Web.UI.Page
    {
        public DataTable dnND = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            //string userName = HttpContext.Current.User.Identity.Name;
            //if (userName.Equals("admin", StringComparison.OrdinalIgnoreCase))
            //{
            //    Response.Redirect("~/Admin/ThemSanPham.aspx", true);
            //}
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string taikhoan = tbTK.Text.Trim();
            string matkhau = tbMK.Text.Trim();

            // Thiết lập và mở kết nối đến cơ sở dữ liệu
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringREShare"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"SELECT MANV AS Ma, TaiKhoan, MatKhau, 'NhanVien' AS Loai FROM NhanVien 
                     WHERE TaiKhoan = @taiKhoan AND MatKhau = @matKhau
                     UNION
                     SELECT MAKH AS Ma, TaiKhoan, MatKhau, 'KhachHang' AS Loai FROM KhachHang 
                     WHERE TaiKhoan = @taiKhoan AND MatKhau = @matKhau";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@taiKhoan", taikhoan);
                command.Parameters.AddWithValue("@matKhau", matkhau);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {

                        string loai = reader["Loai"].ToString();
                        string ma = reader["Ma"].ToString();

                        Session["dnND_Ma"] = ma;
                        if (loai == "NhanVien")
                        {
                            string queryNV = "SELECT * FROM NhanVien WHERE TaiKhoan = @taiKhoan";
                            reader.Close();
                            SqlCommand commandNV = new SqlCommand(queryNV, connection);
                            commandNV.Parameters.AddWithValue("@taiKhoan", taikhoan);

                            SqlDataReader readerNV = commandNV.ExecuteReader();
                            if (readerNV.HasRows)
                            {
                                dnND.Load(readerNV);
                                Session["dnND"] = dnND;
                            }

                            readerNV.Close();
                            Response.Redirect("~/Admin/DanhSachSanPham.aspx");
                        }
                        else if (loai == "KhachHang")
                        {

                            string queryKH = "SELECT * FROM KhachHang WHERE TaiKhoan = @taiKhoan";
                            reader.Close(); // Đóng DataReader trước khi thực hiện truy vấn tiếp theo

                            SqlCommand commandKH = new SqlCommand(queryKH, connection);
                            commandKH.Parameters.AddWithValue("@taiKhoan", taikhoan);

                            SqlDataReader readerKH = commandKH.ExecuteReader();

                            if (readerKH.HasRows)
                            {
                                dnND.Load(readerKH);
                                Session["dnND"] = dnND;
                            }

                            readerKH.Close();
                            Response.Redirect("~/Customers/GioHang.aspx");
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Tài khoản hoặc mật khẩu không đúng');", true);
                    }
                }
                catch (Exception ex)
                {
                    this.Title = ex.Message;
                }

            }
            tbTK.Text = "";
            tbMK.Text = "";
            Session["dnND"] = dnND;
        }
    }
}