using System;
using System.IO;
using System.Globalization;
using System.Collections.Generic;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Meowntain
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        static string picturePath;

        protected void Page_Load(object sender, EventArgs e)
        {
            txtDateTime.Text = DateTime.Now.ToString("yyyy-MM-ddTHH:mm");
        }

        protected void Upload()
        {
            if (FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                picturePath = Server.MapPath("~/CatPictures/") + fileName;
                FileUpload1.PostedFile.SaveAs(picturePath);
                Console.WriteLine(picturePath);
            }
        }

        protected void btnAddCat_Click(object sender, EventArgs e)
        {
            this.Upload();

            string catName     = txtCatName.Text;
            string description = txtDescription.Text;
            char[] delmintier = new char[] {'.'};
            string dateTime    = txtDateTime.Text.Replace("T", " ").Split(delmintier)[0];

            SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "INSERT INTO [Cat] (Name, Date_Arrived, Picture_path, Description) VALUES ('" +
                catName + "', '" + dateTime + "', '" + picturePath + "', '" + description + "')";

            cmd.Connection = db;

            db.Open();

            try
            {
                if (cmd.ExecuteNonQuery() > 0)
                {
                    Response.Redirect(Request.RawUrl);
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