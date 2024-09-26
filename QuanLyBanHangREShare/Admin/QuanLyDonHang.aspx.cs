using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyBanHangREShare.Admin
{
    public partial class QuanLyDonHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grdDH_SelectedIndexChanged(object sender, EventArgs e)
        {
            lb.Text = "Thông tin chi tiết đơn đặt hàng đã chọn:";
            grdCTDDH.Visible = true;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grdDH_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grdDH.Rows[e.RowIndex];
            string maDH = grdDH.DataKeys[e.RowIndex].Values["MaDH"].ToString();
            DropDownList ddlTinhTrang = (DropDownList)row.FindControl("DropDownList1");

            // Thiết lập giá trị cho UpdateCommand
            srcDDH.UpdateParameters["TinhTrang"].DefaultValue = ddlTinhTrang.SelectedValue;
            srcDDH.UpdateParameters["MaDH"].DefaultValue = maDH;

            // Thực hiện cập nhật
            srcDDH.Update();

            // Cập nhật lại GridView sau khi cập nhật dữ liệu
            grdDH.DataBind();
        }
    }
}