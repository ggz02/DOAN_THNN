<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="BaoCaoThongKe.aspx.cs" Inherits="QuanLyBanHangREShare.Admin.BaoCao" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 42px;
        }
        .auto-style3 {
            height: 42px;
            width: 574px;
        }
        .auto-style4 {
            height: 42px;
            width: 616px;
        }
        .auto-style5 {
            width: 616px;
        }
    </style>
    <link href="../assets/ChiTietSanPham.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="page_top wrapper_chitietsanpham">
         <%-- Phần Tên Hàng --%>
     <h2 class="page_title">BÁO CÁO, THỐNG KÊ DOANH THU </h2>
         <table class="auto-style1">
             <tr>
                 <td class="auto-style4">
                     <asp:Label ID="lblTuNgay" runat="server" Text="Từ ngày:" Font-Size="Large"></asp:Label>
                     <asp:TextBox ID="tbTuNgay" runat="server" Font-Size="Large"></asp:TextBox>
                     <asp:ImageButton ID="imgTuNgay" runat="server" Height="31px" ImageUrl="~/img/1111.png" OnClick="imgTuNgay_Click" Width="38px" />
                 </td>
                 <td class="auto-style3">
                     <asp:Label ID="lblDenNgay" runat="server" Text="Đến ngày:" Font-Size="Large"></asp:Label>
                     <asp:TextBox ID="tbDenNgay" runat="server" Font-Size="Large"></asp:TextBox>
                     <asp:ImageButton ID="imgDenNgay" runat="server" Height="34px" ImageUrl="~/img/1111.png" OnClick="imgDenNgay_Click" Width="42px" />
                 </td>
                 <td class="auto-style2">
                    <asp:Button ID="btnXuatBC" runat="server"
                        Text="Xuất báo cáo"
                        ForeColor="#ffffff" Font-Size="Large"
                        Width="220px"
                        OnClick="btnXuatBC_Click" Height="40px" BackColor="#179D49" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Visible="False" />
                 </td>
             </tr>
             <tr>
                 <td class="auto-style5">
                     <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="249px" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False" Width="301px" CellPadding="1">
                         <DayHeaderStyle BackColor="#99CCCC" Height="1px" ForeColor="#336666" />
                         <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                         <OtherMonthDayStyle ForeColor="#999999" />
                         <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                         <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                         <TitleStyle BackColor="#003399" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" BorderColor="#3366CC" BorderWidth="1px" Height="25px" />
                         <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                         <WeekendDayStyle BackColor="#CCCCFF" />
                     </asp:Calendar>
                 </td>
                 <td colspan="2">
                     <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="249px" OnSelectionChanged="Calendar2_SelectionChanged" Visible="False" Width="301px" CellPadding="1">
                         <DayHeaderStyle BackColor="#99CCCC" Height="1px" ForeColor="#336666" />
                         <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                         <OtherMonthDayStyle ForeColor="#999999" />
                         <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                         <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                         <TitleStyle BackColor="#003399" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" BorderColor="#3366CC" BorderWidth="1px" Height="25px" />
                         <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                         <WeekendDayStyle BackColor="#CCCCFF" />
                     </asp:Calendar>
                 </td>
             </tr>
         </table>
     <br />
         <asp:GridView ID="grdDH" runat="server" AllowPaging="True" CssClass="GridView"
    AutoGenerateColumns="False" CellPadding="4"
    DataKeyNames="MaDH"
    DataSourceID="srcDH" Width="100%" BackColor="#179D49" BorderColor="#CCCCCC" BorderWidth="1px" BorderStyle="Solid">
    <RowStyle BackColor="White" ForeColor="#333333" Height="150px" HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Large" />
    <Columns>
        <%-- Phần Sửa xóa --%>

        <%-- Phần Mã Hàng --%>
        <asp:BoundField DataField="MaDH" HeaderText="Mã đơn hàng" ReadOnly="True" SortExpression="MaDH">
        </asp:BoundField>

        <%-- Phần Tên Hàng --%>
        <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" SortExpression="MaKH" Visible="False">
        </asp:BoundField>

        <%-- Phần Load Data --%>

        <%-- Phần đơn vị tính --%>
        <asp:BoundField DataField="NgayDH" HeaderText="Ngày đặt hàng" SortExpression="NgayDH" DataFormatString="{0:dd-MM-yyyy}">
        </asp:BoundField>

        <%-- Phần đơn giá --%>
        <asp:BoundField DataField="TriGia" HeaderText="Tổng tiền" SortExpression="TriGia" DataFormatString="{0:0,000 VNĐ}">
        </asp:BoundField>
        <asp:BoundField DataField="TenNguoiNhan" HeaderText="Tên người nhận" SortExpression="TenNguoiNhan" />
        <asp:BoundField DataField="DiaChiNhan" HeaderText="Địa chỉ nhận" SortExpression="DiaChiNhan" />
        <asp:BoundField DataField="SoDT" HeaderText="Số điện thoại" SortExpression="SoDT" />
        <asp:BoundField DataField="HThanhToan" HeaderText="Hình thức thanh toán" SortExpression="HThanhToan" />
    </Columns>
    <PagerStyle CssClass="Page_detailProduct" BackColor="#179D49" ForeColor="White" HorizontalAlign="Center" Font-Size="Large" />
    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#179D49" Font-Bold="True" ForeColor="White" Height="45px" Font-Size="X-Large" />
    <FooterStyle BackColor="Crimson" Font-Bold="true" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#487575" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#275353" />
</asp:GridView>
         <asp:SqlDataSource ID="srcDH" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringREShare %>" SelectCommand="GtDDHByDateRange" SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="TuNgay" PropertyName="SelectedDate" />
                 <asp:ControlParameter ControlID="Calendar2" DbType="Date" Name="DenNgay" PropertyName="SelectedDate" />
             </SelectParameters>
         </asp:SqlDataSource>
     </div>
</asp:Content>
