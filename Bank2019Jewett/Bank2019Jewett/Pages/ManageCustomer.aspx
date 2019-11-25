<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SecureMasterPage.master" AutoEventWireup="true" CodeBehind="ManageCustomer.aspx.cs" Inherits="Bank2019Jewett.Pages.ManageCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
    <asp:GridView ID="grvCustomer" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="dsCustomerList" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="Black" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" Visible="False" />
        <asp:BoundField DataField="vcFirstName" HeaderText="First Name" SortExpression="vcFirstName" />
        <asp:BoundField DataField="vcLastName" HeaderText="Last Name" SortExpression="vcLastName" />
    </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
</asp:GridView>
<asp:SqlDataSource ID="dsCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:CIS41100ConnectionString2 %>" SelectCommand="SELECT [CustomerID], [vcFirstName], [vcLastName] FROM [tblJewettCustomer]"></asp:SqlDataSource>
    <asp:FormView ID="frvCustomer" runat="server" CellPadding="4" DataKeyNames="CustomerID" DataSourceID="dbCustomerUpdate" ForeColor="Black" AllowPaging="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" GridLines="Vertical">
        <EditItemTemplate>
            CustomerID:
            <asp:Label ID="CustomerIDLabel1" runat="server" Text='<%# Eval("CustomerID") %>' />
            <br />
            vcFirstName:
            <asp:TextBox ID="vcFirstNameTextBox" runat="server" Text='<%# Bind("vcFirstName") %>' />
            <br />
            vcLastName:
            <asp:TextBox ID="vcLastNameTextBox" runat="server" Text='<%# Bind("vcLastName") %>' />
            <br />
            vcAddress:
            <asp:TextBox ID="vcAddressTextBox" runat="server" Text='<%# Bind("vcAddress") %>' />
            <br />
            intAge:    
            <asp:TextBox ID="intAgeTextBox" runat="server" Text='<%# Bind("intAge") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
         <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </EmptyDataTemplate>
        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            vcFirstName: 
            <asp:TextBox ID="vcFirstNameTextBox" runat="server" Text='<%# Bind("vcFirstName") %>' />
            <br />
            vcLastName:         
            <asp:TextBox ID="vcLastNameTextBox" runat="server" Text='<%# Bind("vcLastName") %>' />
            <br />
            vcAddress:
            <asp:TextBox ID="vcAddressTextBox" runat="server" Text='<%# Bind("vcAddress") %>' />
            <br />
            intAge:          
            <asp:TextBox ID="intAgeTextBox" runat="server" Text='<%# Bind("intAge") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            CustomerID:
            <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("CustomerID") %>' />
            <br />
            vcFirstName:
            <asp:Label ID="vcFirstNameLabel" runat="server" Text='<%# Bind("vcFirstName") %>' />
            <br />
            vcLastName:
            <asp:Label ID="vcLastNameLabel" runat="server" Text='<%# Bind("vcLastName") %>' />
            <br />
            vcAddress:
            <asp:Label ID="vcAddressLabel" runat="server" Text='<%# Bind("vcAddress") %>' />
            <br />
            intAge:
            <asp:Label ID="intAgeLabel" runat="server" Text='<%# Bind("intAge") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
    </asp:FormView>
    <asp:SqlDataSource ID="dbCustomerUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:CIS41100ConnectionString2 %>" DeleteCommand="DELETE FROM [tblJewettCustomer] WHERE [CustomerID] = @CustomerID" InsertCommand="INSERT INTO [tblJewettCustomer] ([vcFirstName], [vcLastName], [vcAddress], [intAge]) VALUES (@vcFirstName, @vcLastName, @vcAddress, @intAge)" SelectCommand="SELECT * FROM [tblJewettCustomer] WHERE ([CustomerID] = @CustomerID)" UpdateCommand="UPDATE [tblJewettCustomer] SET [vcFirstName] = @vcFirstName, [vcLastName] = @vcLastName, [vcAddress] = @vcAddress, [intAge] = @intAge WHERE [CustomerID] = @CustomerID" OnDeleted="dbCustomerUpdate_Deleted" OnInserted="dbCustomerUpdate_Inserted" OnUpdated="dbCustomerUpdate_Deleted" OnSelected="dbCustomerUpdate_Selected">
        <DeleteParameters>
            <asp:Parameter Name="CustomerID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="vcFirstName" Type="String" />
            <asp:Parameter Name="vcLastName" Type="String" />
            <asp:Parameter Name="vcAddress" Type="String" />
            <asp:Parameter Name="intAge" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="grvCustomer" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="vcFirstName" Type="String" />
            <asp:Parameter Name="vcLastName" Type="String" />
            <asp:Parameter Name="vcAddress" Type="String" />
            <asp:Parameter Name="intAge" Type="Int32" />
            <asp:Parameter Name="CustomerID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
