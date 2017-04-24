using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Meowntain
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {


            SqlConnection con = new SqlConnection(SqlDataSource1.ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [Appointment] SET isApproved ='1', Approved_By = '3' WHERE AppointmentID = '" + GridView1.SelectedRow.Cells[0].Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/ApproveAppointment.aspx");
        }
    }
}
