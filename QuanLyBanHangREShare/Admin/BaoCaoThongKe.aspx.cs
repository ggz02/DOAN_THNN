using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.Shared;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Globalization;
using Newtonsoft.Json.Linq;

namespace QuanLyBanHangREShare.Admin
{
    public partial class BaoCao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.ClientScript.GetPostBackEventReference(this, string.Empty);
        }

        protected void imgTuNgay_Click(object sender, ImageClickEventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            tbTuNgay.Text = Calendar1.SelectedDate.ToString("dd-MM-yyyy");
            Calendar1.Visible= false;
        }

        protected void imgDenNgay_Click(object sender, ImageClickEventArgs e)
        {
            Calendar2.Visible = true;
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            tbDenNgay.Text = Calendar2.SelectedDate.ToString("dd-MM-yyyy");
            Calendar2.Visible = false;
            btnXuatBC.Visible = true;
        }

        protected void btnXuatBC_Click(object sender, EventArgs e)
        {
            string ngayTu = DateTime.ParseExact(Calendar1.SelectedDate.ToString("dd-MM-yyyy"), "dd-MM-yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd");
            string ngayDen = DateTime.ParseExact(Calendar2.SelectedDate.ToString("dd-MM-yyyy"), "dd-MM-yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd");

            string conStr = WebConfigurationManager.ConnectionStrings["ConnectionStringREShare"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "GtDDHByDateRange";
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@TuNgay", ngayTu);
            command.Parameters.AddWithValue("@DenNgay", ngayDen);
            command.Connection = con;
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = command;
            DataTable dt = new DataTable();
            adapter.Fill(dt);
                                   
            //ReportDocument report = new ReportDocument();
            //report.Load(Server.MapPath("BC.rpt"));
            //report.SetDataSource(data2);
            BC report = new BC();
            report.SetDataSource(dt);

            report.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Báo cáo doanh thu REShare");
        }
    }
}