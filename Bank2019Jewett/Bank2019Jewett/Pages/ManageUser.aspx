<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SecureMasterPage.master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="Bank2019Jewett.Pages.ManageUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
    <asp:FormView ID="frvUsers" runat="server" DataKeyNames="UserID" DataSourceID="dbUsers" AllowPaging="True" CellPadding="4" ForeColor="Black" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" GridLines="Vertical">
    <EditItemTemplate>
        UserID:
        <asp:Label ID="UserIDLabel1" runat="server" Text='<%# Eval("UserID") %>' />
        <br />
        vcFirstName:      
        <asp:TextBox ID="vcFirstNameTextBox" runat="server" Text='<%# Bind("vcFirstName") %>' />
        <br />
        vcLastName:   
        <asp:TextBox ID="vcLastNameTextBox" runat="server" Text='<%# Bind("vcLastName") %>' />
        <br />
        vcUserName:
        <asp:TextBox ID="vcUserNameTextBox" runat="server" Text='<%# Bind("vcUserName") %>' />
        <br />
        vcPassword:
        <asp:TextBox ID="vcPasswordTextBox" runat="server" Text='<%# Bind("vcPassword") %>' />
        <br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </EditItemTemplate>
        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </EmptyDataTemplate>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
    <InsertItemTemplate>
        vcFirstName:
        <asp:TextBox ID="vcFirstNameTextBox" runat="server" Text='<%# Bind("vcFirstName") %>' />
        <br />
        vcLastName:
        <asp:TextBox ID="vcLastNameTextBox" runat="server" Text='<%# Bind("vcLastName") %>' />
        <br />
        vcUserName:
        <asp:TextBox ID="vcUserNameTextBox" runat="server" Text='<%# Bind("vcUserName") %>' />
        <br />
        vcPassword:
        <asp:TextBox ID="vcPasswordTextBox" runat="server" Text='<%# Bind("vcPassword") %>' />
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ValidationGroup="InsertValidation" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        UserID:
        <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
        <br />
        vcFirstName:
        <asp:Label ID="vcFirstNameLabel" runat="server" Text='<%# Bind("vcFirstName") %>' />
        <br />
        vcLastName:
        <asp:Label ID="vcLastNameLabel" runat="server" Text='<%# Bind("vcLastName") %>' />
        <br />
        vcUserName:
        <asp:Label ID="vcUserNameLabel" runat="server" Text='<%# Bind("vcUserName") %>' />
        <br />
        vcPassword:
        <asp:Label ID="vcPasswordLabel" runat="server" Text='<%# Bind("vcPassword") %>' />
        <br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
    </ItemTemplate>
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
</asp:FormView>
<asp:SqlDataSource ID="dbUsers" runat="server" ConnectionString="<%$ ConnectionStrings:CIS41100ConnectionString %>" DeleteCommand="DELETE FROM [tblJewettUser] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [tblJewettUser] ([vcFirstName], [vcLastName], [vcUserName], [vcPassword]) VALUES (@vcFirstName, @vcLastName, @vcUserName, @vcPassword)" SelectCommand="SELECT [UserID], [vcFirstName], [vcLastName], [vcUserName], [vcPassword] FROM [tblJewettUser]" UpdateCommand="UPDATE [tblJewettUser] SET [vcFirstName] = @vcFirstName, [vcLastName] = @vcLastName, [vcUserName] = @vcUserName, [vcPassword] = @vcPassword WHERE [UserID] = @UserID">
    <DeleteParameters>
        <asp:Parameter Name="UserID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="vcFirstName" Type="String" />
        <asp:Parameter Name="vcLastName" Type="String" />
        <asp:Parameter Name="vcUserName" Type="String" />
        <asp:Parameter Name="vcPassword" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="vcFirstName" Type="String" />
        <asp:Parameter Name="vcLastName" Type="String" />
        <asp:Parameter Name="vcUserName" Type="String" />
        <asp:Parameter Name="vcPassword" Type="String" />
        <asp:Parameter Name="UserID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>



</asp:Content>
