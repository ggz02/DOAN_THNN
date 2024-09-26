<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="ThemSanPham.aspx.cs" Inherits="QuanLyBanHangREShare.Admin.ThemSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    </script>
    <link href="../assets/ThemSanPham.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            height: 52px;
        }
        .auto-style2 {
            width: 23%;
        }
        .auto-style3 {
            height: 52px;
            width: 23%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page_top wrapper_themsanpham">
        <h2 class="page_title">THÊM SẢN PHẨM</h2>
        <div style="display: grid; justify-content: space-around; grid-template-columns: auto auto;">
            <div>
                <asp:Image CssClass="img_add" ID="Image1" runat="server" /><img src="../img/market-img.png" />
            </div>
            <table style="width: 100%; font-size: 25px; font-weight: bold">
                <tr>
    <td class="auto-style2">Loại sản phẩm</td>
    <td>
        <asp:DropDownList ID="drpLoai" runat="server"
            DataSourceID="srcLoaiHang"
            DataTextField="TENLOAI"
            DataValueField="MALOAI"  Width="378px" Font-Size="Large" OnSelectedIndexChanged="drpLoai_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="srcLoaiHang" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionStringREShare %>"
            SelectCommand="SELECT MALOAI, TENLOAI FROM LOAISP ORDER BY TENLOAI"></asp:SqlDataSource>
    </td>
    <td>&nbsp; </td>
</tr>
                <tr>
                    <td class="auto-style2">Mã sản phẩm</td>
                    <td>
                        <asp:TextBox ID="txtMaSP" runat="server"  Width="378px" Enabled="False" Font-Size="Large"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMaSP" ErrorMessage="Nhập mã sản phẩm!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Tên sản phẩm</td>
                    <td>
                        <asp:TextBox ID="txtTenSP" runat="server"  Width="378px" Font-Size="Large"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTenSP" ErrorMessage="Nhập tên sản phẩm!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                
                <tr>
                    <td class="auto-style2">Giá bán</td>
                    <td>
                        <asp:TextBox ID="txtGIABAN" runat="server"  Width="378px" Font-Size="Large"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtGIABAN" ErrorMessage="Nhập đơn giá!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Nhà cung cấp</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="drpNCC" runat="server"
                            DataSourceID="srcNCC" DataTextField="TenNCC" DataValueField="MaNCC"  Width="378px" Font-Size="Large">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="srcNCC" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringREShare %>"
                            SelectCommand="SELECT MaNCC, TenNCC FROM NhaCungCap Order by MaNCC "></asp:SqlDataSource>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
    <td class="auto-style2">Mô tả sản phẩm</td>
    <td>
        <asp:TextBox ID="txtMotaSP" runat="server" TextMode="MultiLine" Rows="6" Height="57px" Width="378px" Font-Size="Large"></asp:TextBox>
    </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtMotaSP" ErrorMessage="Nhập mô tả sản phẩm!" ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
</tr>
                <tr>
                    <td class="auto-style2">Hình sản phẩm</td>
                    <td>
                        <asp:FileUpload ID="upHinh" runat="server" ForeColor="#179D49"  Width="378px" Font-Size="Large"/>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="uphinh" ErrorMessage="Chọn hình ảnh!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="display: flex; justify-content: space-around; align-items: center" class="auto-style2">
                        <asp:Button ID="butAdd" runat="server" Text="Thêm" OnClick="butAdd_Click" ForeColor="#ffffff" Font-Size="XX-Large" />
                        <asp:Button ID="butCancel" runat="server" Text="Hủy Bỏ" ForeColor="#ffffff" OnClick="butCancel_Click" CausesValidation="False" Font-Size="XX-Large" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp; </td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server" Style="font-size: 14px; color: #0033CC"></asp:Label>
                    </td>
                    <td>&nbsp; </td>
                </tr>
            </table>

        </div>
    </div>
</asp:Content>
