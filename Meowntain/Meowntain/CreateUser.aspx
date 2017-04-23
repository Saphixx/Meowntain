<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="Meowntain.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContent" runat="server">
    <div class="createUser">
        <asp:TextBox ID="txtFistName" runat="server" class="formInput" placeholder="First Name"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtLastName" runat="server" class="formInput" placeholder="Last Name"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtUserName" runat="server" class="formInput" placeholder="Username"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtEmail" runat="server" class="formInput" placeholder="Email"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtPhone" runat="server" class="formInput" placeholder="Phone Number"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtPassword" runat="server" class="formInput" placeholder="Password" TextMode="Password"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtPasswordConfirmation" runat="server" class="formInput" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Email not formatted correctly" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPassword" ErrorMessage="*Password does not meet requirments" ForeColor="Red" ToolTip="Passwords should begin with a letter, should include an uppercase letter , a lowercase letter and a digit. Passwords should at least be 8 characters long." ValidationExpression="^(?=[a-zA-Z]*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$"></asp:RegularExpressionValidator>
        <br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPasswordConfirmation" ErrorMessage="*Passwords must match" ForeColor="Red"></asp:CompareValidator>
        <br />
        <asp:Button ID="btnCreateUser" runat="server" class="w3-button w3-black w3-padding-large w3-large w3-margin-top" Text="Create User" OnClick="btnCreateUser_Click" />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MeowntainConnectionString %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
    </div>
</asp:Content>
