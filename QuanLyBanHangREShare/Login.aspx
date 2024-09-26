<%@ Page Title="" Language="C#" MasterPageFile="~/Master_1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QuanLyBanHangREShare.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

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

        @keyframes fadeInAnimation {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        .img_login_shop {
            min-height: 50px;
            height: 556px;
            width: 100%;
        }

        .login_form {
            justify-self: self-start;
            align-self: center;
            border-radius: 40px;
            border: 1px solid #ddd;
            padding: 35px;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        }

        .loginStyle {
            font-family: Helvetica Neue,Helvetica,Arial,sans-serif;
            font-size: 16px;
            color: #202124;
            margin: 20px auto;
            text-align: left;
            width: 100%;
        }

            .loginStyle .login_button {
                border: none;
                background-color: crimson;
                padding: 26px 0;
                border-radius: 10px;
                width: 100%;
                height: 20px;
                color: #fff;
                font-size: 20px;
                font-weight: bold;
                margin: 16px 0;
                cursor: pointer;
                padding-top: 16px;
                line-height: 12px;
            }

                .loginStyle .login_button:hover {
                    background-color: #179D49;
                    box-shadow: 0 2px 4px 2px rgba(0,0,0,0.5);
                }

            .loginStyle .login_title {
                text-transform: uppercase;
                font-size: 32px;
                padding-bottom: 36px;
                font-weight: bold;
            }

            .loginStyle .login_label, #login .login_textbox {
                display: block;
                margin-bottom: 30px;
            }

            .loginStyle .login_label {
                padding: 4px;
            }

            .loginStyle .login_textbox {
                border: 1px solid #ccc;
                width: 100%;
                margin: 0 0 10px 6px;
                outline-color: crimson;
                border-radius: 4px;
                padding: 6px 10px;
                transform: translateY(-15px);
            }

            .loginStyle .login_hyperlink {
                font-style: italic;
                text-decoration: underline;
            }

                .loginStyle .login_hyperlink:hover {
                    color: purple
                }

        .auto-style2 {
            width: inherit;
            margin-right: 0;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper_login container">
        <div class="login_img">
            <asp:ImageButton ID="img_login_shop" CssClass="img_login_shop" runat="server" ImageUrl="~/img/contactBackground.png" PostBackUrl="~/Menu.aspx" />
        </div>
        <div class="login_form">
    <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
        <tr>
            <td>
                <table cellpadding="0" class="auto-style2">
                    <tr>
                        <td align="center" class="login_title" colspan="2"style="font-size: 25px;">Đăng Nhập</td>
                    </tr>
                    <tr>
                        <td style="width: 30%; font-size: 22px;"class="login_label">
                            <asp:Label ID="UserNameLabel" runat="server">Tài Khoản</asp:Label>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="tbTK" Style="color: red;" ErrorMessage="Nhập UserName!" ToolTip="User Name is required." ValidationGroup="lgnDangNhap">*</asp:RequiredFieldValidator>
                        </td>
                        <td style="width: 100%;">
                            <asp:TextBox ID="tbTK" runat="server" CssClass="login_textbox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="login_label" style="width: 305px; font-size: 22px;">
                            <asp:Label ID="PasswordLabel" runat="server">Mật Khẩu</asp:Label>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="tbMK" Style="color: red;" ErrorMessage="Nhập Password!" ToolTip="Password is required." ValidationGroup="lgnDangNhap">*</asp:RequiredFieldValidator>
                        </td>
                        <td style="width: 100%;">
                            <asp:TextBox ID="tbMK" runat="server" CssClass="login_textbox" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:CheckBox ID="RememberMe" runat="server" Style="margin-left: 20px; margin-right: 4px;" />
                            Ghi nhớ mật khẩu lần sau
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="color: Red;">
                            <asp:Label ID="FailureText" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="login_button" Text="Đăng Nhập" OnClick="LoginButton_Click" Font-Size="Small" />
                        </td>
                    </tr>
                    <tr>
                        <td class="login_hyperlink" colspan="2">
                            <asp:HyperLink ID="CreateUserLink" runat="server" NavigateUrl="~/DangKy.aspx">Đăng Ký</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>

    </div>
</asp:Content>
