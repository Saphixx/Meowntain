<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="RequestAppointment.aspx.cs" Inherits="Meowntain.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContent" runat="server">
        <!-- Header -->
        <header class="w3-container w3-red w3-center" style="padding:128px 16px">
            <h1 class="w3-margin w3-jumbo">Meowntain</h1>
            <p class="w3-xlarge">Cat Shelter</p>
        </header>
        
        <!-- First Grid -->
        <div class="w3-row-padding w3-padding-64 w3-container">
            <div class="w3-content">
                <div class="w3-third w3-center">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns = "False">
                                    <Columns>

                                        
                                        
                                        <asp:BoundField  DataField = "CatID" HeaderText="CatID" />
                                        
                                        <asp:Boundfield DataField = "Name" HeaderText ="Name" />
                                        <asp:BoundField DataField = "Date_Arrived" HeaderText = "Date Arrived" />
                                        <asp:BoundField DataField = "Description" HeaderText = "Cat Bio" />
                                        <asp:ImageField DataImageUrlField="Picture_Path" ControlStyle-Width="100"
                                         ControlStyle-Height = "100" HeaderText = "Cat Preview">
                                        <ControlStyle Height="100px" Width="100px"></ControlStyle>
                                        </asp:ImageField>
                                        
                                    </Columns>
                                </asp:GridView>
                    <asp:TextBox ID="txtDateTime" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
                    <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="Submit" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MeowntainConnectionString %>" SelectCommand="SELECT [CatID], [Date_Arrived], [Picture_Path], [Description], [Name] FROM [Cat]"></asp:SqlDataSource>
                </div>

            </div>
        </div>
</asp:Content>
