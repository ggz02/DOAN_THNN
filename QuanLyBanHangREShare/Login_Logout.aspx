<%@ Page Title="" Language="C#" MasterPageFile="~/Master_1.Master" AutoEventWireup="true" CodeBehind="Login_Logout.aspx.cs" Inherits="QuanLyBanHangREShare.Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/loginLogout.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .wrapper_loginlogout {
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
    </style>
    <div class="page_top center wrapper_loginlogout">
        <strong>
            <asp:LinkButton ID="status1" runat="server" OnClick="Status_Click" Font-Size="Large" ForeColor="Red" Text="Logout"></asp:LinkButton>
            <br />
        </strong>
        <hr />
    </div>
</asp:Content>
