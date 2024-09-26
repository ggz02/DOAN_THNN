<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyDonHang.aspx.cs" Inherits="QuanLyBanHangREShare.Admin.QuanLyDonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="page_top wrapper_chitietsanpham">
         <%-- Phần Mã Hàng --%>
     <h2 class="page_title">QUẢN LÝ ĐƠN HÀNG</h2>
         <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Các đơn đặt hàng:"></asp:Label>
     <br />
         <asp:GridView ID="grdDH" runat="server" AllowPaging="True" CssClass="GridView"
    AutoGenerateColumns="False" CellPadding="4"
    DataSourceID="srcDDH" Width="100%" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" OnSelectedIndexChanged="grdDH_SelectedIndexChanged" DataKeyNames="MaDH" PageSize="7" OnRowUpdating="grdDH_RowUpdating">
    <RowStyle BackColor="White" ForeColor="#333333" Height="100px" HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Large" />
    <PagerStyle CssClass="Page_detailProduct" BackColor="#179D49" ForeColor="White" HorizontalAlign="Center" Font-Size="Medium" />
    <SelectedRowStyle BackColor="#FFFF66" Font-Bold="True" ForeColor="Black" />
    <HeaderStyle BackColor="#179D49" Font-Bold="True" ForeColor="White" Height="45px" Font-Size="X-Large" />
             <Columns>
                 <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                 <asp:BoundField DataField="MaDH" HeaderText="Mã đơn hàng" ReadOnly="True" SortExpression="MaDH" >
                 <HeaderStyle Width="80px" />
                 <ItemStyle Width="80px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" SortExpression="MaKH" ReadOnly="True" >
                 <HeaderStyle Width="80px" />
                 <ItemStyle Width="80px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="NgayDH" HeaderText="Ngày đặt hàng" SortExpression="NgayDH" DataFormatString="{0:dd-MM-yyyy}" ReadOnly="True" >
                 <HeaderStyle Width="120px" />
                 <ItemStyle Width="120px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="TriGia" DataFormatString="{0:0,000 VNĐ}" HeaderText="Tổng tiền" SortExpression="TriGia" ReadOnly="True" />
                 <asp:BoundField DataField="TenNguoiNhan" HeaderText="Tên người nhận" SortExpression="TenNguoiNhan" ReadOnly="True" />
                 <asp:BoundField DataField="DiaChiNhan" HeaderText="Địa chỉ nhận" SortExpression="DiaChiNhan" ReadOnly="True" >
                 <ItemStyle HorizontalAlign="Left" />
                 </asp:BoundField>
                 <asp:BoundField DataField="SoDT" HeaderText="Số điện thoại" SortExpression="SoDT" ReadOnly="True">  <HeaderStyle Width="140px"/></asp:BoundField>
                 <asp:BoundField DataField="HThanhToan" HeaderText="Hình thức thanh toán" SortExpression="HThanhToan" ReadOnly="True" ><HeaderStyle Width="200px" /><ItemStyle HorizontalAlign="Left" /></asp:BoundField>
                 <asp:TemplateField HeaderText="Tình trạng" SortExpression="TinhTrang">
                     <EditItemTemplate>
                         <asp:DropDownList ID="DropDownList1" runat="server">
                             <asp:ListItem Value="Đang chuẩn bị">Đang chuẩn bị</asp:ListItem>
                              <asp:ListItem Value="Đang giao">Đang giao</asp:ListItem>
                              <asp:ListItem Value="Đã giao">Đã giao</asp:ListItem>
                         </asp:DropDownList>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("TinhTrang") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:CommandField CancelText="Hủy" EditText="Cập nhật" ShowEditButton="True" UpdateText="Xác nhận" />
             </Columns>
             <EditRowStyle Font-Size="Large" />
    <FooterStyle BackColor="Crimson" Font-Bold="true" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#487575" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#275353" />
</asp:GridView>
         <asp:SqlDataSource ID="srcDDH" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringREShare %>" SelectCommand="SELECT * FROM [DonDatHang]" UpdateCommand="UPDATE DonDatHang SET TinhTrang = @TinhTrang WHERE MaDH = @MaDH">
    <UpdateParameters>
        <asp:Parameter Name="TinhTrang" Type="String" />
        <asp:Parameter Name="MaDH" Type="String" />
    </UpdateParameters></asp:SqlDataSource>
     <br />
         <asp:Label ID="lb" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
     <br />
         <%-- Phần Tên Hàng --%>
     <asp:GridView ID="grdCTDDH" runat="server" AllowPaging="True" CssClass="GridView"
         AutoGenerateColumns="False" CellPadding="4"
         DataKeyNames="MaDH,MASP"
         DataSourceID="srcCTDDH"
         PageSize="5" Width="100%" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" Visible="False" HorizontalAlign="Center">
         <RowStyle BackColor="White" ForeColor="#333333" Height="80px" HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Large" />
         <Columns>
             <%-- Phần Sửa xóa --%>

             <%-- Phần Mã Hàng --%>
             <asp:BoundField DataField="MaDH" HeaderText="MaDH" ReadOnly="True" SortExpression="MaDH" Visible="False">
             </asp:BoundField>

             <%-- Phần Tên Hàng --%>
             <asp:BoundField DataField="MASP" HeaderText="Mã sản phẩm" ReadOnly="True" SortExpression="MASP">
             </asp:BoundField>

             <%-- Phần Load Data --%>

             <%-- Phần đơn vị tính --%>
             <asp:BoundField DataField="DONGIA" HeaderText="Đơn giá" SortExpression="DONGIA" DataFormatString="{0:0,000 VNĐ}">
             </asp:BoundField>

             <%-- Phần đơn giá --%>
             <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" SortExpression="SoLuong">
             </asp:BoundField>
             <asp:BoundField DataField="ThanhTien" DataFormatString="{0:0,000 VNĐ}" HeaderText="Thành tiền" SortExpression="ThanhTien" />
         </Columns>
         <PagerStyle CssClass="Page_detailProduct" BackColor="#339933" ForeColor="White" HorizontalAlign="Center" />
         <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
         <HeaderStyle BackColor="#339933" Font-Bold="True" ForeColor="White" Height="45px" HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="X-Large" />
         <EditRowStyle Height="0px" HorizontalAlign="Center" VerticalAlign="Middle" />
         <FooterStyle Font-Bold="true" ForeColor="White" />
         <SortedAscendingCellStyle BackColor="#F7F7F7" />
         <SortedAscendingHeaderStyle BackColor="#487575" />
         <SortedDescendingCellStyle BackColor="#E5E5E5" />
         <SortedDescendingHeaderStyle BackColor="#275353" />
     </asp:GridView>

         <asp:SqlDataSource ID="srcCTDDH" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringREShare %>" SelectCommand="SELECT * FROM [CTDonDatHang] WHERE ([MaDH] = @MaDH2)">
             <SelectParameters>
                 <asp:ControlParameter ControlID="grdDH" Name="MaDH2" PropertyName="SelectedValue" Type="String" />
             </SelectParameters>
         </asp:SqlDataSource>

     <%-- Phần Load Data --%>
     <br />
 </div>
</asp:Content>
