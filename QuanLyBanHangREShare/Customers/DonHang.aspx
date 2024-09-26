<%@ Page Title="" Language="C#" MasterPageFile="~/Master_1.Master" AutoEventWireup="true" CodeBehind="DonHang.aspx.cs" Inherits="QuanLyBanHangREShare.DonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .page_title {
            color: #000 !important;
            text-align: center;
            margin-bottom: 16px;
            font-weight: 600;
            font-size: 36px !important;
        }

        .lblTongTien {
            float: right;
            margin-right: 296px;
        }

        .label_form {
            font-size: medium;
            color: #000;
            text-align: right;
            font-weight: 500;
        }

        .input_form {
            border-color: Black;
            height: 30px;
            width: 250px;
            margin-left: 20px;
            padding: 15px;
            width: 480px;
            border: 1px solid #ddd !important;
        }
        .edit-form-ddh {
            border: 1px solid #ddd;
            width: 915px;
            margin: auto;
            padding: 40px;
            border-radius: 20px;
        }

        .error_message {
            padding-left:16px;
        }
    </style>

    <link href="../assets/DonHang.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function showAlert(message) {
            alert(message);
        }
    </script>
    <!-- Thêm jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Sau đó, thêm Bootstrap -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        function showPaymentInfo() {
            var ddlHTTT = document.getElementById('<%= ddlHTTT.ClientID %>');
            var paymentInfoInput = document.getElementById("ContentPlaceHolder1_ddlHTTT");

            if (ddlHTTT.value === "Thanh toán bằng tiền mặt") {
                paymentInfoInput.options[1].selected = true;
                
            } else if (ddlHTTT.value === "Thanh toán bằng thẻ") {
                ddlHTTT.selected = 2;
            }
        }


        // Hàm kiểm tra lựa chọn từ DropDownList và hiển thị modal tương ứng
        function showPaymentModal() {
            var ddlHTTT = document.getElementById('<%= ddlHTTT.ClientID %>');

            if (ddlHTTT.value === "Thanh toán bằng thẻ") {
                $('#paymentModal').modal('show');
            }
        }
    </script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script>
        function showSuccessPay() {
            alert('Thanh toán thành công!');
        }

       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page_top wrapper_donhang" style="color: #0033CC;">
        <%-- Tên hàng --%>
        <h3 class="page_title">THÔNG TIN ĐƠN HÀNG</h3>

        <%-- Đơn giá --%>

        <div class="container text-center">

            <asp:GridView ID="dtgvDonHang" runat="server"
                AutoGenerateColumns="False" CellPadding="4"
                BackColor="White"
                Width="100%" BorderColor="#CCCCCC"
                BorderStyle="Solid"
                BorderWidth="1px" GridLines="Horizontal" DataKeyNames="MaSP">
                <Columns>
                    <%-- Mã sản phẩm --%>
                    <asp:BoundField DataField="MaSP" HeaderText="Mã Hàng" Visible="False">
                        <HeaderStyle Width="80px" HorizontalAlign="Center" />
                    </asp:BoundField>

                    <%-- Tên hàng --%>
                    <asp:BoundField DataField="TenSP" HeaderText="Tên Sản Phẩm">
                        <HeaderStyle Width="150px" HorizontalAlign="Center" />
                    </asp:BoundField>

                    <%-- Đơn giá --%>
                    <asp:BoundField DataField="Gia" HeaderText="Giá bán" DataFormatString="{0:0,000 VNĐ}">
                        <HeaderStyle Width="80px" HorizontalAlign="Center" />
                    </asp:BoundField>

                    <%-- Số lượng --%>
                    <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng">
                        <HeaderStyle Width="80px" HorizontalAlign="Center" />
                    </asp:BoundField>

                    <%-- Thành tiền --%>
                    <asp:BoundField DataField="TongTien" HeaderText="Thành Tiền"
                        DataFormatString="{0:0,000 VNĐ}">
                        <HeaderStyle Width="100px" HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#009900" Font-Bold="True" ForeColor="White" Height="45px" Font-Size="X-Large" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" Height="50px" Font-Size="Large" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>
        </div>

        <br />

        <%-- Đơn giá --%>
        <asp:Label CssClass="lblTongTien" ID="lblTongTien" runat="server" ForeColor="#333333" Style=" font-weight: bold"></asp:Label>
        <br />
        <br />
        <h3 style="text-align: center; color: #000; font-weight: 600; margin-bottom: 30px; margin-top: 30px; font-size:x-large">THÔNG TIN NGƯỜI NHẬN</h3>
        <div class="edit-form-ddh">

            <table class="table_info">
                <tr>
                    <td class="label_form">Tên người nhận:</td>
                    <td>
                        <asp:TextBox ID="txtHoTen" runat="server" CssClass="input_form" BorderColor="Black" Width="300px" Height="30px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="error_message" ControlToValidate="txtHoTen" ErrorMessage="Nhập họ tên!"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblSum" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="label_form">Email:</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="input_form" BorderColor="Black" Width="300px" Height="30px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="error_message" ControlToValidate="txtEmail" ErrorMessage="Nhập Email!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label_form">Điện thoại:</td>
                    <td>
                        <asp:TextBox ID="txtDienThoai" runat="server" CssClass="input_form" BorderColor="Black" Width="300px" Height="30px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="error_message" ControlToValidate="txtDienThoai" ErrorMessage="Nhập số điện thoại!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label_form">Số nhà:</td>
                    <td>
                        <asp:TextBox ID="txtSoNha" runat="server" CssClass="input_form" BorderColor="Black" Width="300px" Height="30px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="error_message" ControlToValidate="txtSoNha" ErrorMessage="Nhập số nhà!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label_form">Đường:</td>
                    <td>
                        <asp:TextBox ID="txtDuong" runat="server" CssClass="input_form" BorderColor="Black" Width="300px" Height="30px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="error_message" ControlToValidate="txtDuong" ErrorMessage="Nhập đường!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label_form">Phường/xã:</td>
                    <td>
                        <asp:TextBox ID="txtPhuong" runat="server" CssClass="input_form" BorderColor="Black" Width="300px" Height="30px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" CssClass="error_message" ControlToValidate="txtPhuong" ErrorMessage="Nhập phường/xã!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label_form">Quận/huyện:</td>
                    <td>
                        <asp:TextBox ID="txtQuan" runat="server" CssClass="input_form" BorderColor="Black" Width="300px" Height="30px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" CssClass="error_message" ControlToValidate="txtQuan" ErrorMessage="Nhập quận/huyện!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label_form">Tỉnh/TP:</td>
                    <td>
                        <asp:TextBox ID="txtTP" runat="server" CssClass="input_form" BorderColor="Black" Width="300px" Height="30px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" CssClass="error_message" ControlToValidate="txtTP" ErrorMessage="Nhập tỉnh/tp!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label_form">Phương thức thanh toán:</td>
                    <td style="padding-left:20px;">
                        <asp:DropDownList ID="ddlHTTT" runat="server"  BackColor="White" onchange="showPaymentModal()" Font-Overline="False" Font-Strikeout="False" ForeColor="Black" BorderColor="Black" Width="300px" Height="30px">
                            <asp:ListItem Value="Thanh toán bằng tiền mặt">Thanh toán bằng tiền mặt</asp:ListItem>
                            <asp:ListItem Value="Thanh toán bằng thẻ">Thanh toán bằng thẻ</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" CssClass="error_message"  ControlToValidate="ddlHTTT" ErrorMessage="Chọn phương thức thanh toán!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center; padding-top: 25px;">
                        <asp:Button ID="butDongY" runat="server"
                            Text="Đặt hàng"
                            ForeColor="#ffffff" Font-Size="X-Large"
                            Style="font-size: x-large" Width="220px"
                            OnClick="butDongY_Click" Height="40px" />
                        &nbsp; 
                 <asp:Label ID="lblStatus" runat="server"
                     ForeColor="#0033CC" Style="font-size: 14px">
                 </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                </tr>
            </table>
        </div>



    </div>
    <div class="modal" id="paymentModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <!-- Cấu trúc modal -->
                <div class="modal-header">
                    <h5 class="modal-title">Thông Tin Thanh Toán Bằng Thẻ</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Form để nhập thông tin thanh toán bằng thẻ -->
                    <div class="form-group">
                        <label for="txtCardNumber">Số Thẻ:</label>
                        <input type="text" id="txtCardNumber" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="txtExpDate">Ngày Hết Hạn:</label>
                        <input type="text" id="txtExpDate" class="form-control" placeholder="MM/YY" />
                    </div>
                    <div class="form-group">
                        <label for="txtCVV">Mã Bảo Mật:</label>
                        <input type="text" id="txtCVV" class="form-control" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary" onclick="showSuccessPay()" data-dismiss="modal">Thanh Toán</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
