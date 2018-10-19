using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReMag
{
    public partial class images : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUploadControl.HasFile)
            {

                string filename = Path.GetFileName(FileUploadControl.FileName);
                FileUploadControl.SaveAs(Server.MapPath("~/images/") + filename);
                Response.Redirect("images.aspx?up=Y");

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var literal = new LiteralControl();
            IList<string> strList = new List<string>();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM images WHERE ID = '" + Request.QueryString["ID"] + "'";
            cmd.Connection = conn;
            var reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    literal.Text = literal.Text + "<li><img src=" + reader["path"].ToString() + " alt=31 title=31 id=wows1_0/></li>";

                }
            }
            reader.Close();
            conn.Close();

            ImagePlaceHolder.Controls.Add(literal);
        }
    }

}