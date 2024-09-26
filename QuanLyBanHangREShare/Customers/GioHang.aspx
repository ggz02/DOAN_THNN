<%@ Page Title="" Language="C#" MasterPageFile="~/Master_1.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="QuanLyBanHangREShare.GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/GioHang.css" rel="stylesheet" type="text/css" />
    <style>
        .lbl_emptyCart {
            margin-right: 439px;
        }
        .page_title {
            color: #000 !important;
            text-align: center;
            margin-bottom: 16px;
            font-weight: 600;
            font-size: 36px !important;
        }

        .auto-style1 {
            font-weight: bold;
            float: right;
        }

    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript">
        function showAlert(message) {
            Swal.fire({
                title: 'Thông báo!',
                text: message,
                icon: 'success',
                confirmButtonText: 'Đóng'
            });
        }

        function showAlertInfo(message) {
            Swal.fire({
                title: 'Thông báo!',
                text: message,
                icon: 'info',
                confirmButtonText: 'Đóng'
            });
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page_top wrapper_Giohang">
        <h2 class="page_title title_giohang ">Giỏ Hàng</h2>
        <div class="wrapper_emptyCart">
            <asp:Label CssClass="lbl_emptyCart" ID="lbl_emptyCart" runat="server" Text="GIỎ HÀNG CỦA &lt;br/&gt;
                BẠN ĐANG TRỐNG. &lt;br/&gt;
                HÃY ĐẶT MÓN &lt;br/&gt;
                NGAY!"></asp:Label>
            <asp:Image CssClass="img_emptyCart" ID="imgEmptcart" runat="server" ImageUrl="~/img/emptycart.png" />
            <div class="wrapper_btn_emptyProduct">
                <asp:Button CssClass="btn_empty" ID="btn_datngay" runat="server" PostBackUrl="~/Menu.aspx" Text="Bắt đầu đặt hàng" />
                <asp:Button CssClass="btn_empty" ID="btn_hisProduct_emty" runat="server" Text="Lịch sử đặt hàng" PostBackUrl="~/Customers/LichSuDonHang.aspx" />            
            </div>
        </div>

        <div class="container">
                    <asp:GridView CssClass="giohang_grdview" ID="dgvGiohang" runat="server"
            OnRowDeleting="grdGioHang_RowDeleting" AutoGenerateColumns="False"
            CellPadding="4" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid"
            BorderWidth="1px" GridLines="Horizontal">
            <Columns>
                <%-- Phàn mã hàng --%>
                <asp:BoundField DataField="MASP" HeaderText="Mã Hàng" ReadOnly="True" Visible="False">
                    <HeaderStyle Width="80px" />
                </asp:BoundField>

                <%-- Phần tên hàng --%>
                <asp:BoundField DataField="TENSP" HeaderText="Tên Sản Phẩm" ReadOnly="True">
                    <HeaderStyle Width="200px" />
                </asp:BoundField>

                <%-- Phàn đơn giá --%>
                <asp:BoundField DataField="GIA" HeaderText="Giá Bán" DataFormatString="{0:0,000 VNĐ}" ApplyFormatInEditMode="True" ReadOnly="True">
                    <HeaderStyle Width="80px" />
                </asp:BoundField>

                <%-- Phần số lượng --%>
                <asp:BoundField DataField="SOLUONG" DataFormatString="{0:0,000 VNĐ}" HeaderText="Số Lượng">
                    <HeaderStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="TONGTIEN" DataFormatString="{0:0,000 VNĐ}" HeaderText="Thành Tiền" ReadOnly="True">
                    <HeaderStyle Width="120px" />
                </asp:BoundField>
                <%-- Phần Sửa xóa --%>
<asp:CommandField CancelText="Hủy Bỏ" DeleteText="Xóa" EditText="Sửa" ShowDeleteButton="True" UpdateText="Cập Nhật">
    <HeaderStyle Width="60px" />
</asp:CommandField>
            </Columns>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#009900" Font-Bold="True" ForeColor="White" Height="45px" Font-Size="X-Large" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" Height="50px" Font-Size="Large" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        </div>


        <br />
        <asp:Label CssClass="lblTongTien" ID="lblTongTien" runat="server" ForeColor="#0033CC" Style="color: #000;  float: right; font-size: 20px; margin-right: 296px;"></asp:Label>
        <br />
        <br />
        <div class="d-flex justify-content-center mt-1">
            <asp:Button CssClass="btn_dathang" ID="btn_tieptucmuahang" runat="server" PostBackUrl="~/Menu.aspx" Text="Tiếp Tục Mua Hàng" Font-Size="X-Large" />
            &nbsp;
            <asp:Button CssClass="btn_dathang" ID="btndathang" runat="server" Text="Đặt Hàng" OnClick="btndathang_Click" Font-Size="X-Large" />
            &nbsp;            
            <asp:Button ID="btnhisproduct" runat="server" Text="Lịch sử đặt hàng" PostBackUrl="~/Customers/LichSuDonHang.aspx" Font-Size="X-Large" />
        </div>
    </div>
</asp:Content>
