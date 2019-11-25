<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/OutsideMasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Bank2019Jewett.Pages.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">

    <asp:Panel CssClass="loginTable" ID="Panel1" runat="server" DefaultButton="BtnLogin">

    <table style="width: 25%;">
        <tr>
            <td id="lblUsername" class="auto-style5">
                <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtUsername" runat="server">wjewett</asp:TextBox>
            </td>
            <td class="auto-style8"></td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                (password1)</td>
            <td class="auto-style4"></td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td>
              
                <asp:Button class ="mybtn" ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" />
                  <asp:SqlDataSource ID="dbLogin" runat="server" ConnectionString="<%$ ConnectionStrings:CIS41100ConnectionString2 %>" SelectCommand="SELECT [UserID], [vcUserName], [vcPassword] FROM [tblJewettUser] WHERE ([vcUserName] = @vcUserName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtUsername" Name="vcUserName" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td>
              
                <asp:HyperLink ID="HyperLink1" runat="server">Forget Id or Password?</asp:HyperLink>
              
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
        </asp:Panel>

</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            height: 10px;
        }
        .auto-style4 {
            height: 10px;
        }

        }
        .auto-style5 {
            height: 79px;
            width: 207px;
        }
        .auto-style6 {
            height: 10px;
            width: 207px;
        }
        .auto-style7 {
            width: 207px;
        }
        .auto-style8 {
            height: 79px;
            width: 208px;
        }
        .loginTable{
            padding-left:150px;
        }
    </style>
</asp:Content>

