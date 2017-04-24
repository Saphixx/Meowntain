using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Meowntain
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        Boolean submitted = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            

            txtDateTime.Text = DateTime.Now.ToString("yyyy-MM-ddTHH:mm");

            HttpCookie cookie_cat = Request.Cookies["CatSelect"];

            DataTable dt = new DataTable();

            
            string strQuery = "select * from [Cat] where CatID = @Name order by CatID ";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.AddWithValue("@Name", cookie_cat["catID"]);
            SqlConnection con = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;

            try
            {
                con.Open();
                sda.SelectCommand = cmd;
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
                sda.Dispose();
                con.Dispose();
            }

        }



        protected void Submit_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid && !submitted)
            {
                HttpCookie cookie_cat = Request.Cookies["CatSelect"];
                char[] delmintier = new char[] { '.' };
                string dateTime = txtDateTime.Text.Replace("T", " ").Split(delmintier)[0];

                SqlConnection con = new SqlConnection(SqlDataSource1.ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO [Appointment](User_FK, Cat_FK, Date) VALUES ('2', '"+ cookie_cat["catID"] + "','" + dateTime + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}