using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;
using System.Configuration;
using System.Web.UI.WebControls.WebParts;

namespace QuanLyBanHangREShare
{
    public partial class DonHang : System.Web.UI.Page
    {
        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadData();
        }
        protected void LoadData()
        {
            //Tạo kích thước cho cột
            dt = (DataTable)Session["GioHang"];
            dtgvDonHang.DataSource = dt;
            dtgvDonHang.DataBind();
            //dtgvDonHang.Columns[0].ControlStyle.Width = 80;
            //dtgvDonHang.Columns[0].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            dtgvDonHang.Columns[1].ControlStyle.Width = 150;
            dtgvDonHang.Columns[1].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            dtgvDonHang.Columns[2].ControlStyle.Width = 80;
            dtgvDonHang.Columns[2].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            dtgvDonHang.Columns[3].ControlStyle.Width = 80;
            dtgvDonHang.Columns[3].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            dtgvDonHang.Columns[4].ControlStyle.Width = 80;
            dtgvDonHang.Columns[4].ItemStyle.HorizontalAlign = HorizontalAlign.Center;

            //Kiểm tra nếu bảng giỏ hàng có giá trị thì sẽ in ra label tổng tiền
            if (dt != null)
            {
                double tong = (double)Session["tong"];
                lblTongTien.Text = "Tổng tiền trên giỏ hàng là: " + String.Format("{0:0,000 VNĐ}", tong);
            }
        }
       
        //Event nhấn đặt hàng
        protected void butDongY_Click(object sender, EventArgs e)
        {
            double tong = (double)Session["tong"];
            DateTime ngayDHh = System.DateTime.Now;

            string conStr = WebConfigurationManager.ConnectionStrings["ConnectionStringREShare"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            SqlDataAdapter adapt = new SqlDataAdapter();
            string newMaDH = "";

            try
            {
                con.Open();

                // Lấy dữ liệu từ Session cho bảng DDH
                string maKHH = (string)Session["dnND_Ma"];

                double triGia = tong;
                string tenNguoiNhan = txtHoTen.Text;
                string diaChiNhan = txtSoNha.Text + ", " + txtDuong.Text + ", " + txtPhuong.Text + ", " + txtQuan.Text + ", " + txtTP.Text;
                string soDT = txtDienThoai.Text;
                string hThanhToan = ddlHTTT.SelectedValue;

               

                // Tạo câu lệnh INSERT cho bảng DDH
                adapt.InsertCommand = new SqlCommand("INSERT INTO DONDATHANG VALUES (@MaDH, @MaKH, @NgayDH, @TriGia, @TenNguoiNhan, @DiaChiNhan, @SoDT, @HThanhToan, @TinhTrang)", con);

                string query = "select top (1) MaDH from DONDATHANG order by MaDH desc";
                SqlCommand command = new SqlCommand(query, con);
                string currentMaDH = (string)command.ExecuteScalar();

                // Kiểm tra xem có giá trị nào được trả về không
                if (!string.IsNullOrEmpty(currentMaDH))
                {
                    // Tách số từ MaDH hiện tại và tăng giá trị lên 1
                    string numberPart = currentMaDH.Substring(2); // Lấy phần số sau chuỗi "DH"
                    int number = int.Parse(numberPart);
                    number++;

                    // Tạo chuỗi mới MaDH
                    newMaDH = "DH" + number.ToString("000");
                    adapt.InsertCommand.Parameters.AddWithValue("@MaDH", newMaDH);

                }
                //adapt.InsertCommand.Parameters.AddWithValue("@MaDH", newMaDH);
                adapt.InsertCommand.Parameters.AddWithValue("@MaKH", maKHH);
                adapt.InsertCommand.Parameters.AddWithValue("@NgayDH", ngayDHh.ToString("yyyy-MM-dd"));
                adapt.InsertCommand.Parameters.AddWithValue("@TriGia", triGia);
                adapt.InsertCommand.Parameters.AddWithValue("@TenNguoiNhan", tenNguoiNhan);
                adapt.InsertCommand.Parameters.AddWithValue("@DiaChiNhan", diaChiNhan);
                adapt.InsertCommand.Parameters.AddWithValue("@SoDT", soDT);
                adapt.InsertCommand.Parameters.AddWithValue("@HThanhToan", hThanhToan);
                adapt.InsertCommand.Parameters.AddWithValue("@TinhTrang", "Đang chuẩn bị");
                adapt.InsertCommand.ExecuteNonQuery();

                // Lấy giỏ hàng từ Session cho bảng CTDDH
                DataTable cart = Session["GioHang"] as DataTable;

                // Tạo câu lệnh INSERT cho bảng CTDDH
                SqlCommand cmdInsertCTDDH = new SqlCommand("INSERT INTO CTDonDatHang VALUES (@MaDH, @MaSP, @SoLuong, @DonGia, @ThanhTien)", con);
                foreach (DataRow r in cart.Rows)
                {
                    cmdInsertCTDDH.Parameters.Clear();
                    cmdInsertCTDDH.Parameters.AddWithValue("@MaDH", newMaDH);
                    cmdInsertCTDDH.Parameters.AddWithValue("@MaSP", r["MASP"].ToString());

                    cmdInsertCTDDH.Parameters.AddWithValue("@SoLuong", r["SOLUONG"].ToString());

                    string giaString = r["GIA"].ToString().Replace(" VNĐ", "").Replace(",", "").Trim();
                    cmdInsertCTDDH.Parameters.AddWithValue("@DonGia", giaString);

                    

                    string thanhTienString = r["TONGTIEN"].ToString().Replace(" VNĐ", "").Replace(",", "").Trim();
                    cmdInsertCTDDH.Parameters.AddWithValue("@ThanhTien", thanhTienString);

                    // Thực hiện lệnh INSERT cho bảng CTDDH
                    cmdInsertCTDDH.ExecuteNonQuery();

                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi
                ScriptManager.RegisterStartupScript(this, this.GetType(), "errorAlert", "showAlert('" + ex.Message + "');", true);
            }
            finally
            {
                // Đóng kết nối
                con.Close();
            }

            //gán các toolbox cho các session
            Session["txtHoTen"] = txtHoTen;
            Session["txtEmail"] = txtEmail;
            Session["txtDienThoai"] = txtDienThoai;
            Session["txtSoNha"] = txtSoNha;
            Session["txtDuong"] = txtDuong;
            Session["txtPhuong"] = txtPhuong;
            Session["txtQuan"] = txtQuan;
            Session["txtTP"] = txtTP;
            Session["maDH"] = newMaDH;
            Session["PaymentMethod"] = ddlHTTT.SelectedValue;

            insertHistoryProduct(newMaDH);
            deleteProduct();
            handleEmail(newMaDH, tong);
        }
        protected void insertHistoryProduct(string newMaDH)
        {
            DataTable dtGH = (DataTable)Session["GioHang"];
            DataTable dtHisProduct = dtGH;
            Session["maDH"] = newMaDH;
            Session["HisProduct"] = dtHisProduct;
            Session["HisTONG"] = (double)Session["Tong"];
        }

        protected void handleEmail(string maDonHang, double tong)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(txtEmail.Text);
                mail.From = new MailAddress("2121001008@sv.ufm.edu.vn");
                mail.Subject = "Xác nhận đặt hàng thành công từ REShare";

                //đính kèm hình ảnh vào email và ghi nội dung vào mail
                string imageUrl = "https://reshare.vn/cdn-cgi/image/width=2000,quality=75//assets/home-banner-4.jpg";
                string body = $"<br/><img style=\"width: 100%; height:100%;\" src='{imageUrl}' alt='Embedded Image' />";

                body +=
                    $"<br/>Mã Đơn hàng: <strong>{maDonHang}</strong>" +
                    $"<br/>Họ Tên Khách hàng: <strong>{txtHoTen.Text}</strong>" +
                    $"<br/>Email: <strong>{txtEmail.Text} </strong>" +
                    $"<br/>Số Điện Thoại: <strong>{txtDienThoai.Text} </strong>" +
                    $"<br/>Địa chỉ: <strong>{txtSoNha.Text} {txtDuong.Text}, {txtPhuong.Text}, {txtQuan.Text}, {txtTP.Text}</strong><br/>";

                foreach (GridViewRow row in dtgvDonHang.Rows)
                {
                    string tenHang = row.Cells[1].Text;
                    string soLuong = row.Cells[3].Text;
                    string thanhtien = String.Format("{0:0,000 VNĐ}", row.Cells[4].Text);
                    body +=
                        $"<br/>Tên Sản Phẩm: <strong>{tenHang} </strong>" +
                        $"<br/>Số Lượng: <strong>{soLuong}</strong>" +
                        $"<br/>Thành Tiền: <strong>{thanhtien}  </strong>" +
                        $"<br/>--------------------------------------";
                }
                body += $"<br/>Tổng Tiền: <strong>{String.Format("{0:0,000 VNĐ}", tong)}</strong><br/>";
                body += "Cảm ơn bạn đã đặt hàng tại RESshare.<br/>Bạn đã thành công góp 1 cây xanh cho chiến dịch phủ xanh măng đen đó!";

                mail.Body = body;
                mail.IsBodyHtml = true;

                SmtpClient client = new SmtpClient();
                client.Host = "smtp.gmail.com";
                client.Port = 587;
                client.EnableSsl = true;
                client.Credentials = new NetworkCredential("2121001008@sv.ufm.edu.vn", "zzqg phgi qjui qjvi");
                client.Send(mail);
                Server.Transfer("GuiDonHang.aspx");
            }
            catch (SmtpFailedRecipientException ex)
            {
                lblStatus.Text = "Mail gửi không thành công" + ex.FailedRecipient;
            }
        }

        protected void deleteProduct()
        {
            //DataTable dtGH = (DataTable)Session["GioHang"];
            //foreach (GridViewRow row in dtgvDonHang.Rows)
            //{
            //    string masp = row.Cells[0].Text;

            //    int pos = TimSP(masp, dtGH);

            //    if (pos != -1)
            //    {
            //        dtGH.Rows.RemoveAt(pos);
            //    }
            //}
            //Session["GioHang"] = dtGH;

            DataTable dtGH = (DataTable)Session["GioHang"];
            DataTable dtGHCopied = dtGH.Copy(); // Tạo một bản sao mới của DataTable

            foreach (GridViewRow row in dtgvDonHang.Rows)
            {
                // Lấy mã sản phẩm từ DataKeyNames
                string masp = dtgvDonHang.DataKeys[row.RowIndex]["MaSP"].ToString();
                int pos = TimSP(masp, dtGHCopied);

                if (pos != -1)
                {
                    dtGHCopied.Rows.RemoveAt(pos);
                }
            }

            Session["GioHang"] = dtGHCopied;
           
        }
        
        protected int TimSP(string masp, DataTable dt)
        {
            int pos = -1;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["MASP"].ToString().ToLower() == masp.ToLower())
                {
                    pos = i;
                    break;
                }
            }
            return pos;
        }
        private String ReturnUserID()
        {
            string constr = ConfigurationManager.ConnectionStrings["ASPNETDB"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("ReturnUserID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p1 = new SqlParameter("Username", User.Identity.Name);
            cmd.Parameters.Add(p1);
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                string u = Convert.ToString(rd["UserID"]);
                return u;
            }
            else return "KH01";
        }
    }
}
