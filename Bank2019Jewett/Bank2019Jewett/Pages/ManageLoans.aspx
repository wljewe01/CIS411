<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SecureMasterPage.master" AutoEventWireup="true" CodeBehind="ManageLoans.aspx.cs" Inherits="Bank2019Jewett.ManageLoans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
    <asp:DropDownList ID="customerDDList" runat="server" AutoPostBack="True" DataSourceID="ddCustomerList" DataTextField="vcLastName" DataValueField="CustomerID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="ddCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:CIS41100ConnectionString2 %>" SelectCommand="SELECT * FROM [tblJewettCustomer] ORDER BY [vcLastName]"></asp:SqlDataSource>
    <asp:Label ID="lblPayment" runat="server" Text="Payment"></asp:Label>
    <asp:GridView ID="gvLoansList" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="LoanID" DataSourceID="loans" OnSelectedIndexChanged="gvLoansList_SelectedIndexChanged" CellPadding="4" ForeColor="Black" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="LoanID" HeaderText="LoanID" InsertVisible="False" ReadOnly="True" SortExpression="LoanID" />
            <asp:BoundField DataField="Principal" HeaderText="Principal" SortExpression="Principal" />
            <asp:BoundField DataField="Interest" HeaderText="Interest" SortExpression="Interest" />
            <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
            <asp:BoundField DataField="fkCustomerId" HeaderText="fkCustomerId" SortExpression="fkCustomerId" Visible="False" />
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
    <asp:SqlDataSource ID="loans" runat="server" ConnectionString="<%$ ConnectionStrings:CIS41100ConnectionString2 %>" SelectCommand="SELECT * FROM [tblJewettLoan] WHERE ([fkCustomerId] = @fkCustomerId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="customerDDList" Name="fkCustomerId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="frvCustomerUpdate" runat="server" DataKeyNames="LoanID" DataSourceID="dsCurrentLoan" CellPadding="4" ForeColor="Black" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" GridLines="Vertical" OnPageIndexChanging="frvCustomerUpdate_PageIndexChanging">
        <EditItemTemplate>
            LoanID:
            <asp:Label ID="LoanIDLabel1" runat="server" Text='<%# Eval("LoanID") %>' />
            <br />
            Principal:
            <asp:TextBox ID="PrincipalTextBox" runat="server" Text='<%# Bind("Principal") %>' />
            <br />
            Interest:
            <asp:TextBox ID="InterestTextBox" runat="server" Text='<%# Bind("Interest") %>' />
            <br />
            Month:
            <asp:TextBox ID="MonthTextBox" runat="server" Text='<%# Bind("Month") %>' />
            <br />
            fkCustomerId:
            <asp:TextBox ID="fkCustomerIdTextBox" runat="server" Text='<%# Bind("fkCustomerId") %>' />
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
            Principal:
            <asp:TextBox ID="PrincipalTextBox" runat="server" Text='<%# Bind("Principal") %>' />
            <br />
            Interest:
            <asp:TextBox ID="InterestTextBox" runat="server" Text='<%# Bind("Interest") %>' />
            <br />
            Month:
            <asp:TextBox ID="MonthTextBox" runat="server" Text='<%# Bind("Month") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            LoanID:
            <asp:Label ID="LoanIDLabel" runat="server" Text='<%# Eval("LoanID") %>' />
            <br />
            Principal:
            <asp:Label ID="PrincipalLabel" runat="server" Text='<%# Bind("Principal") %>' />
            <br />
            Interest:
            <asp:Label ID="InterestLabel" runat="server" Text='<%# Bind("Interest") %>' />
            <br />
            Month:
            <asp:Label ID="MonthLabel" runat="server" Text='<%# Bind("Month") %>' />
            <br />
            fkCustomerId:
            <asp:Label ID="fkCustomerIdLabel" runat="server" Text='<%# Bind("fkCustomerId") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
    </asp:FormView>
    <asp:SqlDataSource ID="dsCurrentLoan" runat="server" ConnectionString="<%$ ConnectionStrings:CIS41100ConnectionString2 %>" DeleteCommand="DELETE FROM [tblJewettLoan] WHERE [LoanID] = @LoanID" InsertCommand="INSERT INTO [tblJewettLoan] ([Principal], [Interest], [Month], [fkCustomerId]) VALUES (@Principal, @Interest, @Month, @fkCustomerId)" SelectCommand="SELECT * FROM [tblJewettLoan] WHERE ([LoanID] = @LoanID)" UpdateCommand="UPDATE [tblJewettLoan] SET [Principal] = @Principal, [Interest] = @Interest, [Month] = @Month, [fkCustomerId] = @fkCustomerId WHERE [LoanID] = @LoanID" OnDeleting="dsCurrentLoan_Deleting" OnInserted="dsCurrentLoan_Inserted" OnSelected="dsCurrentLoan_Selected" OnUpdated="dsCurrentLoan_Updated">
        <DeleteParameters>
            <asp:Parameter Name="LoanID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Principal" Type="Decimal" />
            <asp:Parameter Name="Interest" Type="Decimal" />
            <asp:Parameter Name="Month" Type="Int32" />
            <asp:ControlParameter ControlID="customerDDList" Name="fkCustomerId" PropertyName="SelectedValue" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gvLoansList" Name="LoanID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Principal" Type="Decimal" />
            <asp:Parameter Name="Interest" Type="Decimal" />
            <asp:Parameter Name="Month" Type="Int32" />
            <asp:Parameter Name="fkCustomerId" Type="Int32" />
            <asp:Parameter Name="LoanID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="grvSchedule" runat="server" CellPadding="4" ForeColor="Black" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
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
</asp:Content>
