<%@ Page Title="" Language="C#" MasterPageFile="~/Master_1.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="QuanLyBanHangREShare.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/Menu.css" rel="stylesheet" type="text/css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content_menu_show">
        <asp:Menu ID="Menu_Show" CssClass="Menu_Show" runat="server" Orientation="Horizontal" OnMenuItemClick="Menu_Show_MenuItemClick">
            <Items>
                <asp:MenuItem Text="ĐẦM NỮ" Value="LH001"></asp:MenuItem>
                <asp:MenuItem Text="ÁO THUN" Value="LH002"></asp:MenuItem>
                <asp:MenuItem Text="CHÂN VÁY" Value="LH003"></asp:MenuItem>
                <asp:MenuItem Text="QUẦN DÀI" Value="LH004"></asp:MenuItem>
                <asp:MenuItem Text="QUẦN JEAN" Value="LH005"></asp:MenuItem>
                <asp:MenuItem Text="ÁO SƠ MI" Value="LH006"></asp:MenuItem>
                <asp:MenuItem Text="ÁO KHOÁC" Value="LH007"></asp:MenuItem>
                <asp:MenuItem Text="QUẦN SHORT" Value="LH008"></asp:MenuItem>
                <asp:MenuItem Text="ÁO LEN" Value="LH009"></asp:MenuItem>
                <asp:MenuItem Text="ÁO KIỂU" Value="LH010"></asp:MenuItem>
            </Items>
        </asp:Menu>

        <asp:DataList runat="server" CssClass="datalistMenu" DataKeyField="MASP" DataSourceID="sqlsp" style="text-align: center" Width="100%" RepeatColumns="4" ID="lstsp">
            <ItemTemplate>
                <div class="wrapper_datalist">
                    <div class="wrapper_menu_img">
                        <asp:ImageButton ID="ImageButton2" CssClass="menu_img" runat="server" Height="218px" ImageUrl='<%# Eval("HINHANH") %>' Width="260px" PostBackUrl='<%# "~/ChonSanPham.aspx?MASP=" + Eval("MASP") %>' />
                    </div>
                    <br />
                    <asp:HyperLink ID="lnkSp" style="font-size: 18px;
color: #000 !important;
font-weight:600;" CssClass="menu_link" runat="server" Text='<%# Eval("TENSP") %>' NavigateUrl='<%# "~/ChonSanPham.aspx?MASP=" + Eval("MASP") %>'></asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="GIABAN" CssClass="menu_lblgia" runat="server" NavigateUrl='<%# "~/ChonSanPham.aspx?MASP=" + Eval("MASP") %>' Text='<%# Eval("GIABAN","{0:0,000 vnđ}") %>'></asp:HyperLink>
                    <br />
                    <asp:HyperLink CssClass="menu_chonsp" ID="HyperLink1" runat="server" NavigateUrl='<%# "/ChonSanPham.aspx?MASP=" + Eval("MASP") %>'>Chọn</asp:HyperLink>
                    <br />
                </div>
            </ItemTemplate>
        </asp:DataList>

        <asp:SqlDataSource ID="sqlsp" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringREShare %>" ProviderName="<%$ ConnectionStrings:ConnectionStringREShare.ProviderName %>" 
            SelectCommand="SELECT MASP, TENSP,  MALOAI, GIABAN, HINHANH FROM SANPHAM WHERE MALOAI = @maloai "> <%--WHERE MALOAI = @maloai--%>
            <SelectParameters>
                <asp:Parameter Name="maloai" Type="String" DefaultValue="LH001" />
            </SelectParameters>
        </asp:SqlDataSource>
</div>
</asp:Content>
