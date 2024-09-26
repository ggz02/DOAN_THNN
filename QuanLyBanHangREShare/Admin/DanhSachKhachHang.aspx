<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true" CodeBehind="DanhSachKhachHang.aspx.cs" Inherits="QuanLyBanHangREShare.Admin.DanhSachKhachHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/ChiTietSanPham.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page_top wrapper_danhsachkh">
    <%-- Phần title của trang --%>
    <h2 class="page_title">DANH SÁCH KHÁCH HÀNG</h2>
    <br />
    <asp:GridView ID="grdKH" runat="server" AllowPaging="True" CssClass="GridView"
    AutoGenerateColumns="False" CellPadding="4"
    DataKeyNames="UserId"
    DataSourceID="srcKH" GridLines="Horizontal"
    PageSize="15" Width="100%" BackColor="Crimson" BorderColor="Crimson" BorderWidth="1px" BorderStyle="Solid">
    <RowStyle BackColor="White" ForeColor="#333333" Font-Size="Large" HorizontalAlign="Center" VerticalAlign="Middle" Height="45px"/>
    <Columns>
        <%-- Phần Sửa xóa --%>

        <%-- Phần Mã Hàng --%>
        <asp:BoundField DataField="UserId" HeaderText="Mã khách hàng" ReadOnly="True" SortExpression="UserId">
        </asp:BoundField>

        <%-- Phần Tên Hàng --%>
        <asp:BoundField DataField="UserName" HeaderText="Tài khoản" SortExpression="UserName">
        </asp:BoundField>

        <%-- Phần Load Data --%>

        <%-- Phần đơn vị tính --%>
        <asp:BoundField DataField="Password" HeaderText="Mật khẩu" SortExpression="Password">
        </asp:BoundField>

        <%-- Phần đơn giá --%>
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
        </asp:BoundField>
    </Columns>
    <PagerStyle CssClass="Page_detailProduct" BackColor="crimson" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="crimson" Font-Bold="True" ForeColor="White" Height="45px" Font-Size="Larger" />
    <FooterStyle BackColor="Crimson" Font-Bold="true" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#487575" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#275353" />
</asp:GridView>
        <asp:SqlDataSource ID="srcKH" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETDB %>" SelectCommand="GetUserData" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
</asp:Content>
