using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Meowntain
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();


            string strQuery = "select * from [Cat] where isAdopted != '1' order by CatID ";
            SqlCommand cmd = new SqlCommand(strQuery);
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            HttpCookie cookie_cat = new HttpCookie("CatSelect");
            cookie_cat["catID"] = GridView1.SelectedRow.Cells[0].Text;
            Response.Cookies.Add(cookie_cat);
            Response.Redirect("~/RequestAppointment.aspx");
        }
    }
}