using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Meowntain
{
    public partial class Page : System.Web.UI.MasterPage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["LoginInfo"];
            if (cookie != null)
            {
                btnLogin.Text = "Logout";
                if(cookie["isAdmin"] == "True")
                {
                    hlAppointments.Visible = true;
                    hlAddInventory.Visible = true;
                    hlRemoveInventory.Visible = true;
                }
            }
            else
            {
                btnLogin.Text = "Login";
                
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string input = txtUsername.Text;
            string input2 = txtPassword.Text;
            SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);

            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.Text;
            command.CommandText = "SELECT UserId, isAdmin FROM [User] WHERE Username = '" + input + "' AND Password = '" + input2 + "'";
            command.Connection = db;
            db.Open();

            SqlDataReader temp = command.ExecuteReader();
            if (temp.Read())
            {
                HttpCookie cookie = new HttpCookie("LoginInfo");
                cookie["UserID"] = temp["UserId"].ToString();
                cookie["isAdmin"] = temp["isAdmin"].ToString();

                Response.Cookies.Add(cookie);
                id01.Attributes["style"] = "display: none;";

                Response.Redirect(Request.RawUrl);
            }
            else
            {
                //Display an error message
            }
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["LoginInfo"];

            if (cookie == null)
                id01.Attributes["style"] = "display: block;";
            else
            {
                cookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(cookie);
                Response.Redirect("~/TitlePage.aspx");
            }
        }
    }
}