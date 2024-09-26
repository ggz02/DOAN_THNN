using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace QuanLyBanHangREShare
{
    public partial class DangKy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangKy_Click(object sender, EventArgs e)
        {
            if (tbNLMKKH.Text.Trim() == tbMKKH.Text.Trim())
            {
                // Gán mã khách hàng tbMKH.Text = KH + số tăng tiếp theo trong Database
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringREShare"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Check if TaiKhoan already exists
                    string checkTaiKhoanQuery = "SELECT COUNT(*) FROM KhachHang WHERE TaiKhoan = @TaiKhoan";
                    SqlCommand checkCommand = new SqlCommand(checkTaiKhoanQuery, connection);
                    checkCommand.Parameters.AddWithValue("@TaiKhoan", tbTKKH.Text.Trim());

                    int count = (int)checkCommand.ExecuteScalar();

                    if (count > 0)
                    {
                        // TaiKhoan already exists, show error message
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Tài khoản đã tồn tại');", true);
                    }
                    else
                    {
                        // Truy vấn để lấy giá trị MaKH lớn nhất hiện tại từ cơ sở dữ liệu
                        string query = "SELECT TOP (1) MaKH FROM KhachHang ORDER BY MaKH DESC";

                        SqlCommand command = new SqlCommand(query, connection);
                        string currentMaKH = (string)command.ExecuteScalar();

                        // Kiểm tra xem có giá trị nào được trả về không
                        if (!string.IsNullOrEmpty(currentMaKH))
                        {
                            // Tách số từ MaKH hiện tại và tăng giá trị lên 1
                            string numberPart = currentMaKH.Substring(2); // Lấy phần số sau chuỗi "KH"
                            int number = int.Parse(numberPart);
                            number++;

                            // Tạo chuỗi mới MKDH
                            string newMaDH = "KH" + number.ToString("000");
                            tbMKH.Text = newMaDH; //Gán chuỗi mới vào textbox Mã khách hàng
                        }

                        try
                        {
                            SqlDataSourceKH.Insert(); // Thêm thông tin KH mới vào DB
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Tạo tài khoản thành công');", true);
                            Response.Redirect("~/Login.aspx");
                        }
                        catch (System.Exception ex)
                        {
                            string errorMessage = "Gặp lỗi thêm KH: " + ex.Message;
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "errorAlert", "showAlert('" + errorMessage + "');", true);
                        }

                        // Xóa thông tin trong các textbox để khách hàng nhập thông tin mới
                        tbTKH.Text = "";
                        tbDCKH.Text = "";
                        tbEKH.Text = "";
                        tbSDTKH.Text = "";
                        tbTKKH.Text = "";
                        tbNLMKKH.Text = "";
                        tbMKKH.Text = "";
                    }
                    connection.Close();
                }
            }
            else // Mật khẩu và nhập lại mật khẩu không giống nhau
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Mật khẩu không trùng nhau');", true);
                tbNLMKKH.Text = "";
                tbMKKH.Text = "";
            }
        }
    }
}