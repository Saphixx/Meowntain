﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="AddInventory.aspx.cs" Inherits="Meowntain.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContent" runat="server">
    <link rel="stylesheet" href="AddInvenStyle.css">

    <div class="formStyle">
        <asp:TextBox ID="txtCatName" runat="server" class="itemStyle formBox" placeholder="Cat Name"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtDescription" runat="server" class="itemStyle formBox descriptionBox" TextMode="MultiLine" placeholder="Cat Description"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtDateTime" runat="server" class="itemStyle" TextMode="DateTimeLocal"></asp:TextBox>
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <asp:Button ID="btnAddCat" runat="server" class="w3-button w3-black w3-padding-large w3-large w3-margin-top" Text="Add Cat" OnClick="btnAddCat_Click" />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MeowntainConnectionString %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
    </div>
</asp:Content>
