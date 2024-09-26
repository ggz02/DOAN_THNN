<%@ Page Title="" Language="C#" MasterPageFile="~/Master_1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="QuanLyBanHangREShare.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/Style.css" rel="stylesheet" type="text/css" />
    <link href="assets/Home.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Phần slider hình ảnh --%>
    <div class="slider">
        <div class="slider-prev">
            <ion-icon name="chevron-back-sharp"></ion-icon>
        </div>
        <div class="slider-wrapper">
            <div class="slider-main">
                <div class="slider-item">
                    <asp:Image CssClass="slider_img" ID="Image1" runat="server" ImageUrl="~/img/slide1.png" />
                </div>
                <div class="slider-item">
                    <asp:Image CssClass="slider_img" ID="Image4" runat="server" ImageUrl="~/img/slide2.jpg" />
                </div>
                <div class="slider-item">
                    <asp:Image CssClass="slider_img" ID="Image5" runat="server" ImageUrl="~/img/slide3.png" />
                </div>
                <div class="slider-item">
                    <asp:Image CssClass="slider_img" ID="Image6" runat="server" ImageUrl="~/img/slide4.png" />
                </div>
            </div>
        </div>
        <div class="slider-next">
            <ion-icon name="chevron-forward-sharp"></ion-icon>
        </div>
    </div>

    <%-- Phần content --%>
    <div class="content">
        <%-- Phần chọn menu --%>
        <div class="content_menu">
            <h2 class="content_menu_title">HÀNG NGHÌN SẢN PHẨM CÁC LOẠI</h2>

            <%--Phần menu datalist --%>
            <asp:DataList runat="server" CssClass="datalistMenuAbout" DataKeyField="MALOAI" DataSourceID="SqlDataSource2" Style="text-align: center" Width="100%" RepeatColumns="4" ID="DataList1">
                <ItemTemplate>
                    <div class="wrapper_datalistAbout">
                        <div class="wrapper_menu_imgAbout">
                            <asp:ImageButton ID="ImageButton2" CssClass="menu_imgAbout" runat="server" Height="218px" ImageUrl='<%# Eval("HINHANH") %>' Width="260px" PostBackUrl='<%# "Menu.aspx?MALOAI=" + Eval("MALOAI") %>' />
                        </div>
                        <br />
                        <asp:HyperLink ID="lnkSp" CssClass="menu_linkAbout" style="font-size: 18px;
color: #000 !important;
font-weight:600;" runat="server" Text='<%# Eval("TENLOAI") +" >>" %>' NavigateUrl='<%# "Menu.aspx?MALOAI=" + Eval("MALOAI") %>'></asp:HyperLink>
                        <br />
                    </div>
                </ItemTemplate>
            </asp:DataList>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringREShare %>" ProviderName="<%$ ConnectionStrings:ConnectionStringREShare.ProviderName %>" SelectCommand="SELECT * FROM [LOAISP] where MALOAI IN ('LH001','LH002','LH003','LH004','LH005','LH006','LH007','LH010')"></asp:SqlDataSource>
        </div>

        <%-- Phần menu hay đặt hàng --%>
        <div class="content_like">
            <div class="content_like--title">
                <h1>CÓ THỂ BẠN SẼ THÍCH</h1>
                <span></span>
            </div>
            <asp:DataList runat="server" CssClass="datalistMenu" DataKeyField="MASP" DataSourceID="sqlsp" Style="text-align: center" Width="100%" RepeatColumns="4" ID="lstsp" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                <ItemTemplate>
                    <div class="wrapper_datalist">
                        <span class="wrapper_menu_img">
                            <asp:ImageButton ID="ImageButton2" CssClass="menu_img" runat="server" Height="218px" ImageUrl='<%# Eval("HINHANH") %>' Width="260px" PostBackUrl='<%# "~/ChonSanPham.aspx?MASP=" + Eval("MASP") %>' />
                        </span>
                        <br />
                        <asp:HyperLink ID="lnkSp" style="font-size: 18px;
color: #000 !important;
font-weight:600;" CssClass="menu_link" runat="server" Text='<%# Eval("TENSP") %>' NavigateUrl='<%# "~/ChonSanPham.aspx?MASP=" + Eval("MASP") %>'></asp:HyperLink>
                        <br />
                        <asp:HyperLink ID="GIABAN" CssClass="menu_lblgia" runat="server" NavigateUrl='<%# "~/ChonSanPham.aspx?MASP=" + Eval("MASP") %>' Text='<%# Eval("GIABAN","{0:0,000 vnđ}") %>'></asp:HyperLink>
                        <br />
                        <asp:HyperLink CssClass="menu_chonsp" ID="HyperLink1" runat="server" NavigateUrl='<%# "~/ChonSanPham.aspx?MASP=" + Eval("MASP") %>'>Chọn</asp:HyperLink>
                        <br />
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="sqlsp" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringREShare %>" ProviderName="<%$ ConnectionStrings:ConnectionStringREShare.ProviderName %>"
                SelectCommand="SELECT MASP, TENSP,  MALOAI, GIABAN, HINHANH FROM SANPHAM WHERE MALOAI ='LH009' OR MALOAI ='LH008' "></asp:SqlDataSource>
        </div>

        <%--Phần banner--%>
<%--        <div class="banner">
            <div class="banner_App">
                <asp:ImageButton CssClass="banner_img" ID="imgbtn_chplay" runat="server" ImageUrl="~/img/CHPlay.png" OnClick="imgbtn_chplay_Click" />
                <asp:ImageButton CssClass="banner_img" ID="imgbtn_AppStore" runat="server" ImageUrl="~/img/AppStore.png" OnClick="imgbtn_AppStore_Click" />
            </div>
        </div>--%>
    </div>
</asp:Content>
