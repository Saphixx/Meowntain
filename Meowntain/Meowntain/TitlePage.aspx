<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="TitlePage.aspx.cs" Inherits="Meowntain.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContent" runat="server">
    <!-- Header -->
    <header class="w3-container w3-center background" style="padding:128px 16px">
        <h1 class="w3-margin w3-jumbo titleText">Meowntain</h1>
        <p class="w3-xlarge titleText">Cat Shelter</p>
    </header>
        
    <!-- First Grid -->
    <div class="w3-row-padding w3-padding-64 w3-container">
        <div class="w3-content">
            <div class="w3-twothird">
                <h1>What we're all about</h1>
                <h5 class="w3-padding-32">Place Holder</h5>

                <p class="w3-text-grey">Other Place Other</p>
            </div>

            <div class="w3-third w3-center">
                <asp:Image ID="Image1" runat="server" src="CatPictures/SideCat.png"/>
            </div>
        </div>
    </div>
</asp:Content>
