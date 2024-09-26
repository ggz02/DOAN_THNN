<%@ Page Title="" Language="C#" MasterPageFile="~/Master_1.Master" AutoEventWireup="true" CodeBehind="ChonSanPham.aspx.cs" Inherits="QuanLyBanHangREShare.ChonSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/ChonSanPham.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            height: 62px;
            width: 161px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="chonsp">
        <%-- Phần img --%>
        <div class="chonsp_img">
            <asp:Image ID="imgHinh" CssClass="img_chonsp" runat="server" />
        </div>

        <%-- Phần content --%>
        <div class="chonsp_content">
            <h3 style="text-align: center; margin-bottom: 20px">
                <asp:Label ID="lblTenSP" runat="server" Font-Size="X-Large"></asp:Label>
            </h3>
            <table class="w-100">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Black" Height="40px" Text="Giá bán:" Visible="True"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblGIABAN" runat="server" Font-Size="Large" ForeColor="#179C49"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Black" Height="40px" Text="Mô tả:" Visible="True"></asp:Label></td>

                    <%--<asp:TextBox ID="txtSoluong"  runat="server" Text="1" Width="40px" AutoPostBack="True" OnTextChanged="txtSoluong_TextChanged" Height="40px" Visible="False"></asp:TextBox>--%>

                    <td>
                        <asp:Label CssClass="wrap-text" ID="lblmt" runat="server" Font-Size="Medium" Visible="True"></asp:Label></td>

                </tr>

            </table>
            <asp:Label ID="lblMaSP" CssClass="chonsp_content_des" runat="server" Font-Size="Smaller" Visible="False"></asp:Label>
            <br />
            <asp:Button ID="butInsert" runat="server" Text="Thêm Vào Giỏ Hàng" OnClick="butInsert_Click" />
            &nbsp;<asp:Button ID="butCancel" runat="server" PostBackUrl="~/Home.aspx" Text="Trở Về Trang Chủ" />
        </div>
    </div>
</asp:Content>
