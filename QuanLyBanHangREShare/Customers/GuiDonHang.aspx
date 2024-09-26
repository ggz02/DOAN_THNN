<%@ Page Title="" Language="C#" MasterPageFile="~/Master_1.Master" AutoEventWireup="true" CodeBehind="GuiDonHang.aspx.cs" Inherits="QuanLyBanHangREShare.GuiDonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/GuiDonHang.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page_top wrapper_guidonhang">
        <h2 class="page_title">THÔNG BÁO</h2>
        <div class="content_guidonhang">
            <asp:Image CssClass="guihang_img" ID="Image1" runat="server" ImageUrl="~/img/thanksreshare.png" />
            <asp:Label CssClass="lbl_resultguihang" ID="lblThongBao" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
