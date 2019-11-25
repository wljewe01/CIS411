<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/OutsideMasterPage.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Bank2019Jewett.Pages.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <div class = "signUp" _designerregion="0">
        User name&nbsp;&nbsp;
        <asp:TextBox ID="userNameTextBox" runat="server" OnTextChanged="userNameTextBox_TextChanged"></asp:TextBox>
        <br />
        Password&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="passwordTextBox" runat="server"></asp:TextBox>
        <br />
        First Name&nbsp;&nbsp;
        <asp:TextBox ID="firstNameTextBox" runat="server"></asp:TextBox>
        <br />
        Last Name&nbsp;&nbsp;
        <asp:TextBox ID="lastNameTextBox" runat="server"></asp:TextBox>
        <br />
        <asp:SqlDataSource ID="signUpDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CIS41100ConnectionString3 %>"  InsertCommand="INSERT into dbo.tblJewettUser (vcFirstName, vcLastName, vcUserName, vcPassword)
        VALUES (@vcFirstName, @vcLastName, @vcUserName, @vcPassword)" OnSelecting="signUpDataSource_Selecting">
             <InsertParameters>
                       <asp:ControlParameter ControlID="userNameTextBox" Name="vcUserName" PropertyName="Text" Type="String" />
                       <asp:ControlParameter ControlID="passwordTextBox" Name="vcPassword" PropertyName="Text" Type="String" />
                       <asp:ControlParameter ControlID="firstNameTextBox" Name="vcFirstName" PropertyName="Text" Type="String" />
                       <asp:ControlParameter ControlID="lastNameTextBox" Name="vcLastName" PropertyName="Text" Type="String" />
                    </InsertParameters>


        </asp:SqlDataSource>
        <br />
        <asp:Button class=mybtn ID="signUpBtn" runat="server" Text="Sign Up" Width="216px" OnClick="signUpBtn_Click" />
    </div>
</asp:Content>
