using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.DynamicData;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyBanHangREShare
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string userName = HttpContext.Current.User.Identity.Name;
            //if (userName.Equals("admin", StringComparison.OrdinalIgnoreCase))
            //{
            //    Response.Redirect("~/Admin/DanhSachSanPham.aspx", true);
            //}

            // Assuming this code is within a method where the session is accessible

            //if(!IsPostBack)
            //{
            //    DataTable dnND = (DataTable)Session["dnND"];

            //    if (dnND != null && dnND.Rows.Count > 0)
            //    {
            //        string ten = dnND.Rows[0][1].ToString();
            //        Label loginNameLabel = (Label)FindControl("LoginName");

            //        if (loginNameLabel != null)
            //        {
            //            loginNameLabel.Text = ten;
            //        }
            //    }

            //}

            if (Session["dnND"] == null)
            {

                Response.Redirect("~/Login.aspx");
            }
            


        }

        protected void Status_Click(object sender, EventArgs e)
        {
            Session["dnND"] = null;
            Response.Redirect("~/Login.aspx");
        }

    }
}