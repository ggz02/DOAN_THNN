<%@ Page Title="" Language="C#" MasterPageFile="~/Master_1.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="QuanLyBanHangREShare.DangKy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/registerAccount.css" rel="stylesheet" type="text/css" />
    <style>
        .wrapper_login {
            position: relative;
            top: 100px;
            left: 0;
            display: grid;
            grid-template-columns: 2fr 2fr;
            place-items: center;
            gap: 10px;
            opacity: 0;
            animation: fadeInAnimation 1s ease-in-out forwards;
        }

        .img_login_shop {
            min-height: 50px;
            height: 556px;
            width: 100%;
        }

        .formdangky {
            padding: 50px 15px;
            margin: 0 40px;
            font-family: Helvetica Neue,Helvetica,Arial,sans-serif;
            font-size: 16px;
            color: #202124;
            margin: 20px auto;
            text-align: left;
        }

            .formdangky .login_button {
                border: none;
                background-color: crimson;
                padding: 26px 0;
                border-radius: 10px;
                width: 100%;
                height: 20px;
                color: #fff;
                font-size: 16px;
                font-weight: bold;
                margin: 16px 0;
                cursor: pointer;
                padding-top: 10px;
            }

                .formdangky .login_button:hover {
                    background-color: #179D49;
                    box-shadow: 0 2px 4px 2px rgba(0,0,0,0.5);
                }

            .formdangky .login_title {
                text-transform: uppercase;
                font-size: 32px;
                padding-bottom: 36px;
                font-weight: bold;
            }

            .formdangky .login_label, #login .login_textbox {
                display: block;
                margin-bottom: 30px;
            }

            .formdangky .login_label {
                padding: 4px;
            }

            .formdangky .login_textbox {
                border: 1px solid #ccc;
                width: 100%;
                margin: 0 0 10px 6px;
                outline-color: crimson;
                border-radius: 4px;
                padding: 6px 10px;
                transform: translateY(-15px);
            }

        .auto-style1 {
            width: inherit;
        }

        .auto-style3 {
            text-align: center;
        }

        .form-register {
            width: 600px;
            border-radius: 40px;
            border: 1px solid #ddd;
            padding: 35px;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper_login container">
        <div class="auto-style3">
            <asp:ImageButton ID="img_login_shop" CssClass="img_login_shop" runat="server" ImageUrl="~/img/contactBackground.png" PostBackUrl="~/Menu.aspx" />
        </div>
        <div class="formdangky">
            <table class="auto-style6">
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#22B24C" Text="ĐĂNG KÝ"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="lbMKH" runat="server" Text="Mã KH:" Visible="False" Width="250px" Font-Size="Large"></asp:Label>
                        <asp:TextBox ID="tbMKH" runat="server" Visible="False" Font-Size="Large"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="lbTKH" runat="server" Text="Họ tên:" Width="250px" Font-Size="Large"></asp:Label>
                        <asp:TextBox ID="tbTKH" runat="server" Visible="True" Font-Size="Large"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="lbDCKH" runat="server" Text="Địa chỉ:" Width="250px" Font-Size="Large"></asp:Label>
                        <asp:TextBox ID="tbDCKH" runat="server" Visible="True" Font-Size="Large"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="lbEKH" runat="server" Text="Email:" Width="250px" Font-Size="Large"></asp:Label>
                        <asp:TextBox ID="tbEKH" runat="server" Visible="True" Font-Size="Large"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="lbSDTKH" runat="server" Text="Số điện thoại:" Width="250px" Font-Size="Large"></asp:Label>
                        <asp:TextBox ID="tbSDTKH" runat="server" Visible="True" Font-Size="Large"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="lbTK" runat="server" Text="Tài khoản:" Width="250px" Font-Size="Large"></asp:Label>
                        <asp:TextBox ID="tbTKKH" runat="server" Visible="True" Font-Size="Large"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="lbMK" runat="server" Text="Mật khẩu:" Width="250px" Font-Size="Large"></asp:Label>
                        <asp:TextBox ID="tbMKKH" runat="server" Visible="True" TextMode="Password" Font-Size="Large"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="lbNLMK" runat="server" Text="Nhập lại mật khẩu:" Width="250px" Font-Size="Large"></asp:Label>
                        <asp:TextBox ID="tbNLMKKH" runat="server" Visible="True" TextMode="Password" Font-Size="Large"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Button ID="btnDangKy" runat="server" OnClick="btnDangKy_Click" Text="ĐĂNG KÝ" Visible="True" Font-Bold="True" Font-Size="X-Large" BackColor="#22B24C" ForeColor="White" Width="436px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSourceKH" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringREShare %>" ProviderName="<%$ ConnectionStrings:ConnectionStringREShare.ProviderName %>" InsertCommand="INSERT INTO KhachHang(MaKH, TenKH, DiaChi, Email, SoDT, TaiKhoan, MatKhau) VALUES (@MaKH, @TenKH, @DiaChi, @Email, @SoDT, @TaiKhoan, @MatKhau)">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="tbMKH" Name="MaKH" PropertyName="Text" />
                                <asp:ControlParameter ControlID="tbTKH" Name="TenKH" PropertyName="Text" />
                                <asp:ControlParameter ControlID="tbDCKH" Name="DiaChi" PropertyName="Text" />
                                <asp:ControlParameter ControlID="tbEKH" Name="Email" PropertyName="Text" />
                                <asp:ControlParameter ControlID="tbSDTKH" Name="SoDT" PropertyName="Text" />
                                <asp:ControlParameter ControlID="tbTKKH" Name="TaiKhoan" PropertyName="Text" />
                                <asp:ControlParameter ControlID="tbMKKH" Name="MatKhau" PropertyName="Text" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        </div>
</asp:Content>
