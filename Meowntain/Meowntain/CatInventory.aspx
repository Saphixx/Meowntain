<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="CatInventory.aspx.cs" Inherits="Meowntain.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContent" runat="server">
        
        <!-- First Grid -->
        <div class="w3-row-padding w3-padding-64 w3-container">
            <div class="w3-content">
                

                <div id="cat_tables" class="w3-third w3-center" style="margin-top: 1px">
                    
                    <table>
                        <tr>
                            <td style="width: 1444px">

                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns = "False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    <Columns>

                                        
                                        
                                        <asp:BoundField  DataField = "CatID" HeaderText="CatID" />
                                        
                                        <asp:CommandField HeaderText="Appointments" SelectText="Schedule Appointment" ShowSelectButton="True" />
                                        <asp:Boundfield DataField = "Name" HeaderText ="Name" />
                                        <asp:BoundField DataField = "Date_Arrived" HeaderText = "Date Arrived" />
                                        <asp:BoundField DataField = "Description" HeaderText = "Cat Bio" />
                                        <asp:ImageField DataImageUrlField="Picture_Path" ControlStyle-Width="100"
                                         ControlStyle-Height = "100" HeaderText = "Cat Preview">
                                        <ControlStyle Height="100px" Width="100px"></ControlStyle>
                                        </asp:ImageField>
                                        
                                    </Columns>
                                </asp:GridView>

                            </td>
                        </tr>
                    </table>
                    
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MeowntainConnectionString %>" SelectCommand="SELECT [Date_Arrived], [Picture_Path], [Description], [CatID] FROM [Cat]"></asp:SqlDataSource>
        </div>

</asp:Content>
