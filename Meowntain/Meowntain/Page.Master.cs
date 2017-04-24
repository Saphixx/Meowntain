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
        private static string tempUserID;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["LoginInfo"];
            if (cookie != null)
            {
                btnLogin.Text = "Logout";
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
            command.CommandText = "SELECT UserId FROM [User] WHERE Username = '" + input + "' AND Password = '" + input2 + "'";
            command.Connection = db;
            db.Open();

            Object temp = command.ExecuteScalar();
            if (temp == null)
            {
                Response.Redirect("~/AddInventory.aspx");
            }
            else
            {
                tempUserID = temp.ToString();
                HttpCookie cookie = new HttpCookie("LoginInfo");
                cookie["UserID"] = tempUserID;
                Response.Cookies.Add(cookie);
                id01.Attributes["style"] = "display: none;";

                Response.Redirect("~/CreateUser.aspx");
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