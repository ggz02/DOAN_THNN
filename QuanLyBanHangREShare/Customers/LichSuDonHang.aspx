<%@ Page Title="" Language="C#" MasterPageFile="~/Master_1.Master" AutoEventWireup="true" CodeBehind="LichSuDonHang.aspx.cs" Inherits="QuanLyBanHangREShare.Customers.LichSuDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .page_title {
    color: #000 !important;
    text-align: center;
    margin-bottom: 16px;
    font-weight: 600;
    font-size: 36px !important;
}

        .thongbao {
        color: #000 !important;
        font-weight:600;
    font-size: 18px;
    padding-left: 8px;
    display: block;
    margin-left: 373px;
    margin-bottom: 12px;
}
    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript">
        function showAlertInfo(message) {
            Swal.fire({
                title: 'info',
                text: message,
                icon: 'info',
                confirmButtonText: 'Đóng'
            });
        }
    </script>
    <link href="../assets/LichSuDonHang.css" rel="stylesheet" type="text/css" />
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="page_top wrapper_HisProduct">
        <h2 class="page_title">Lịch Sử Đặt Hàng</h2>
        <asp:Label CssClass="thongbao" ID="lblmahd" runat="server" Text=""></asp:Label>
            <div class="container text-center mb-3">
                <asp:GridView CssClass="giohang_grdview" ID="dgvHisProduct" runat="server"
    AutoGenerateColumns="False"
    CellPadding="4" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid"
    BorderWidth="1px" GridLines="Horizontal"> 
    <Columns>

        <%-- Phàn mã hàng --%>
        <asp:BoundField DataField="MASP" HeaderText="Mã Hàng" Visible="False">
            <HeaderStyle Width="80px" />
        </asp:BoundField>

        <%-- Phần tên hàng --%>
        <asp:BoundField DataField="TENSP" HeaderText="Tên Hàng">
            <HeaderStyle Width="200px" />
        </asp:BoundField>

        <%-- Phàn đơn giá --%>
        <asp:BoundField DataField="GIA" HeaderText="Đơn Giá" DataFormatString="{0:0,000 VNĐ}" ApplyFormatInEditMode="True">
            <HeaderStyle Width="80px" />
        </asp:BoundField>

        <%-- Phần số lượng --%>
        <asp:BoundField DataField="SOLUONG" DataFormatString="{0:0,000 VNĐ}" HeaderText="Số Lượng">
            <HeaderStyle Width="80px" />
        </asp:BoundField>
        <asp:BoundField DataField="TONGTIEN" DataFormatString="{0:0,000 VNĐ}" HeaderText="Thành Tiền">
            <HeaderStyle Width="120px" />
        </asp:BoundField>
    </Columns>
    <EditRowStyle BackColor="#e1dfbb" />
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#179D49" Font-Bold="True" ForeColor="White" Height="45px" Font-Size="X-Large" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="White" Height="50px" Font-Size="Large" BorderColor="#CCCCCC" />
    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F8FAFA" />
    <SortedAscendingHeaderStyle BackColor="#246B61" />
    <SortedDescendingCellStyle BackColor="#D4DFE1" />
    <SortedDescendingHeaderStyle BackColor="#15524A" />
</asp:GridView>
            </div>

        
        <asp:Label CssClass="thongbao" style="float:right; margin-right:380px;" ID="lbl_sumMoney" runat="server"></asp:Label>
        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringREShare %>" SelectCommand="SELECT * FROM [LICHSUDONHANG]"></asp:SqlDataSource>--%>
    </div>
</asp:Content>
