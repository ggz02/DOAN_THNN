<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="QuanLyBanHangREShare.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MaDH" DataSourceID="n1">
                <Columns>
                    <asp:BoundField DataField="MaDH" HeaderText="MaDH" ReadOnly="True" SortExpression="MaDH" />
                    <asp:BoundField DataField="MaKH" HeaderText="MaKH" SortExpression="MaKH" />
                    <asp:BoundField DataField="NgayDH" HeaderText="NgayDH" SortExpression="NgayDH" />
                    <asp:BoundField DataField="TriGia" HeaderText="TriGia" SortExpression="TriGia" />
                    <asp:BoundField DataField="TenNguoiNhan" HeaderText="TenNguoiNhan" SortExpression="TenNguoiNhan" />
                    <asp:BoundField DataField="DiaChiNhan" HeaderText="DiaChiNhan" SortExpression="DiaChiNhan" />
                    <asp:BoundField DataField="SoDT" HeaderText="SoDT" SortExpression="SoDT" />
                    <asp:BoundField DataField="HThanhToan" HeaderText="HThanhToan" SortExpression="HThanhToan" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="n1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringREShare %>" SelectCommand="SELECT * FROM [DDH]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
