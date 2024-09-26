using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyBanHangREShare.Customers
{
    public partial class LichSuDonHang : System.Web.UI.Page
    {
        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
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

                ClientScript.RegisterStartupScript(this.GetType(), alertType, alertType+$"('{alertMessage}');", true);

                Session.Remove("AlertMessage");
                Session.Remove("AlertType");
            }
        }
        protected void LoadData()
        {
            double tongTien = 0;
            if (Session["HisProduct"]==null)
            {
                Session["AlertMessage"] = "Chưa có sản phẩm nào được đặt!!";
                Session["AlertType"] = "showAlertInfo";
                Response.Redirect("~/Customers/GioHang.aspx");
            }
            if (Session["HisProduct"]!=null)
            {
                tongTien = (double)Session["HisTONG"];
            }

            dt = (DataTable)Session["HisProduct"];
            object maDH = Session["maDH"];

            if (maDH != null && dt.Rows.Count>0)
            {
                lblmahd.Text = $"Mã hóa đơn:  {maDH}";
            }

            dgvHisProduct.DataSource = dt;
            dgvHisProduct.DataBind();
            dgvHisProduct.Columns[0].ControlStyle.Width = 80;
            dgvHisProduct.Columns[0].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            dgvHisProduct.Columns[1].ControlStyle.Width = 150;
            dgvHisProduct.Columns[1].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            dgvHisProduct.Columns[2].ControlStyle.Width = 80;
            dgvHisProduct.Columns[2].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            dgvHisProduct.Columns[3].ControlStyle.Width = 80;
            dgvHisProduct.Columns[3].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            dgvHisProduct.Columns[4].ControlStyle.Width = 100;
            dgvHisProduct.Columns[4].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            lbl_sumMoney.Text = $"Tổng tiền đã đặt cho hóa đơn  này là: {String.Format("{0:0,000} VNĐ", tongTien)}";
        }

    }
}