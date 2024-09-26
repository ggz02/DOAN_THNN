<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="DanhSachSanPham.aspx.cs" Inherits="QuanLyBanHangREShare.Admin.ChiTietSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/ChiTietSanPham.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page_top wrapper_chitietsanpham">
        <%-- Phần title của trang --%>
        <h2 class="page_title">DANH SÁCH SẢN PHẨM</h2>
        <br />

        <%-- Phần combobox --%>
        <span style="color: black; margin-left: 10px"><span style="font-size: 35px; font-weight: bold">Loại sản phẩm:</span>&nbsp;</span>
        <asp:DropDownList ID="drpLoai" runat="server" AutoPostBack="True"
            DataSourceID="srcLoai" DataTextField="TENLOAI" DataValueField="MALOAI" Font-Size="X-Large" Width="194px">
        </asp:DropDownList>
        <br />

        <%-- Phần DataSource --%>
        <asp:SqlDataSource ID="srcLoai" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionStringREShare %>"
            SelectCommand="SELECT * FROM LOAISP"></asp:SqlDataSource>
        <br />
        <%-- Phần GridView Chi tiết hàng hóa --%>
        <asp:GridView ID="grdMatHang" runat="server" AllowPaging="True" CssClass="GridView"
            AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="MASP"
            DataSourceID="srcMatHang" GridLines="Horizontal"
            PageSize="5" Width="100%" BackColor="#179D49" BorderColor="#179D49" BorderWidth="1px" BorderStyle="Solid" HorizontalAlign="Center" OnRowUpdating="grdMatHang_RowUpdating">
            <RowStyle BackColor="White" ForeColor="#333333" VerticalAlign="Middle" Font-Size="Large" Height="110px" />
            <Columns>
                <%-- Phần Sửa xóa --%>
                <asp:CommandField ControlStyle-CssClass="btn_thaotac"
                    DeleteText="Xóa"
                    EditText="Sửa"
                    ShowDeleteButton="True"
                    ShowEditButton="True"
                    CancelText="Huỷ Bỏ"
                    UpdateText="Cập Nhật" >

                    <ControlStyle CssClass="test"></ControlStyle>

                    <HeaderStyle Width="100px" />

                </asp:CommandField>

                <%-- Phần Mã Hàng --%>
                <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" ReadOnly="True" SortExpression="MaSP">
                    <HeaderStyle Width="80px" HorizontalAlign="Left" />
                </asp:BoundField>

                <%-- Phần Tên Hàng --%>
                <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm">
                    <HeaderStyle Width="120px" HorizontalAlign="Left" />
                </asp:BoundField>

                <%-- Phần Load Data --%>
                <asp:TemplateField>

                    <%-- Hình SP --%>
                    <EditItemTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server"
                            NavigateUrl='<%# Eval("MASP", "~/ChonSanPham.aspx?MASP={0}") %>'>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Image ID="Image1" runat="server" Height="80px" Width="80px"
                                ImageUrl='<%# Eval("HINHANH")%>' />
                        
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle Width="50px" HorizontalAlign="Center" />
                </asp:TemplateField>

                <%-- Phần đơn vị tính --%>
                <asp:BoundField DataField="MOTASP" HeaderText="Mô tả" SortExpression="MOTASP">
                    <HeaderStyle Width="80px" HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>

                <%-- Phần đơn giá --%>
                <asp:BoundField DataField="GIABAN" HeaderText="Giá bán" SortExpression="GIABAN" DataFormatString="{0:0,000 VNĐ}">
                    <HeaderStyle Width="80px" HorizontalAlign="Left" />
                </asp:BoundField>
                 <asp:TemplateField HeaderText="Nhà cung cấp" SortExpression="NHACUNGCAP">
                     <EditItemTemplate>
                         <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="TenNCC" DataValueField="MaNCC" SelectedValue='<%# Bind("MaNCC") %>'>
                         </asp:DropDownList>
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringREShare %>" SelectCommand="SELECT * FROM [NhaCungCap]"></asp:SqlDataSource>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("MaNCC") %>'></asp:Label>  
                     </ItemTemplate>
                     <HeaderStyle HorizontalAlign="Left" Width="80px" />
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="Page_detailProduct" BackColor="#179D49" ForeColor="White" HorizontalAlign="Center" Font-Size="Larger" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#179D49" Font-Bold="True" ForeColor="White" Height="45px" Font-Size="X-Large" />
            <EditRowStyle BackColor="#FFFF66" Font-Size="Large" Height="150px" BorderColor="#CC00CC" />
            <FooterStyle BackColor="#179D49" Font-Bold="true" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>

        <%-- Phần DataSource cho GridView --%>
        <asp:SqlDataSource ID="srcMatHang" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionStringREShare %>"
            DeleteCommand="DELETE FROM SANPHAM WHERE MASP = @MaSP"
            SelectCommand="SELECT MASP, TENSP, MOTASP, GIABAN, MALOAI, HINHANH, MANCC FROM SANPHAM WHERE MALOAI = @MaLoai"
            UpdateCommand="UPDATE SANPHAM SET TENSP = @TenSP, MOTASP = @MOTASP, GIABAN = @GIABAN, MANCC = @MANCC WHERE MASP = @MaSP">
            <DeleteParameters>
                <asp:Parameter Name="MaSP" Type="String" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="drpLoai" Name="MaLoai"
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="TenSP" Type="String" />
                <asp:Parameter Name="MOTASP" />
                <asp:Parameter Name="GIABAN" Type="Double" />
                <asp:Parameter Name="MaSP" Type="String" />
                <asp:Parameter Name="MaNCC" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </div>
</asp:Content>
