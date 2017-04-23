using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Meowntain
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            string username = txtUserName.Text;
            string email = txtEmail.Text;
            string phone = txtPhone.Text;
            string firstName = txtFistName.Text;
            string lastName = txtLastName.Text;
            string password = txtPassword.Text;

            SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "INSERT INTO [User] (FName, LName, Username, Password, Phone, Email) VALUES ('" +
                firstName + "', '" + lastName + "', '" + username + "', '" + password + "', '" + phone + "', '" + email + "')";

            cmd.Connection = db;

            db.Open();

            try
            {
                if (cmd.ExecuteNonQuery() > 0)
                {
                    Response.Redirect("TitlePage.aspx");
                }
            }
            catch (Exception execpt)
            {
                System.Diagnostics.Debug.WriteLine("Problems");
            }
            finally
            {
                db.Close();
            }
        }
    }
}