<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="ApproveAppointment.aspx.cs" Inherits="Meowntain.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContent" runat="server">
    <!-- Header -->
        <header class="w3-container w3-red w3-center" style="padding:128px 16px">
            <h1 class="w3-margin w3-jumbo">Meowntain</h1>
            <p class="w3-xlarge">Cat Shelter</p>
        </header>

        <!-- First Grid -->
        <div class="w3-row-padding w3-padding-64 w3-container">
            <div class="w3-content">
                <div class="w3-twothird">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AppointmentID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="AppointmentID" HeaderText="AppointmentID" InsertVisible="False" ReadOnly="True" SortExpression="AppointmentID" />
                            <asp:BoundField DataField="User_FK" HeaderText="User_FK" SortExpression="User_FK" />
                            <asp:BoundField DataField="Cat_FK" HeaderText="Cat_FK" SortExpression="Cat_FK" />
                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                            <asp:CommandField SelectText="Approve" ShowSelectButton="True" />
                            <asp:CommandField DeleteText="Deny" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="w3-third w3-center">
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MeowntainConnectionString4 %>" DeleteCommand="DELETE FROM [Appointment] WHERE [AppointmentID] = @AppointmentID" InsertCommand="INSERT INTO [Appointment] ([User_FK], [Cat_FK], [Date]) VALUES (@User_FK, @Cat_FK, @Date)" SelectCommand="SELECT [User_FK], [Cat_FK], [Date], [AppointmentID] FROM [Appointment] WHERE ([isApproved] IS NULL)" UpdateCommand="UPDATE [Appointment] SET [User_FK] = @User_FK, [Cat_FK] = @Cat_FK, [Date] = @Date WHERE [AppointmentID] = @AppointmentID">
                    <DeleteParameters>
                        <asp:Parameter Name="AppointmentID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="User_FK" Type="Int32" />
                        <asp:Parameter Name="Cat_FK" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="Date" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="User_FK" Type="Int32" />
                        <asp:Parameter Name="Cat_FK" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="Date" />
                        <asp:Parameter Name="AppointmentID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
</asp:Content>
