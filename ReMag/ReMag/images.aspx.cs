using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
            var literal = new LiteralControl();
            IList<string> strList = new List<string>();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM images WHERE MagID = '" + Request.QueryString["ID"] + "'";
            cmd.Connection = conn;
            var reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    literal.Text = literal.Text + "<div class='carousel-item'><img src='" + reader["path"].ToString() + "' /></div>";
                }
            }
            reader.Close();
            conn.Close();
            ImagePlaceHolder.Controls.Add(literal);
        }
        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUploadControl.HasFile)
            {
                string filename = Path.GetFileName(FileUploadControl.FileName);
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
                SqlDataAdapter da = new SqlDataAdapter("INSERT INTO [images] (MagID, path) VALUES (@ID, @path)", conn);
                da.SelectCommand.Parameters.AddWithValue("@ID", Request.QueryString["ID"]);
                da.SelectCommand.Parameters.AddWithValue("@path", "/images/" + filename);
                DataSet ds = new DataSet();
                da.Fill(ds);
                FileUploadControl.SaveAs(Server.MapPath("/images/") + filename);
                Response.Redirect("images.aspx?up=Y&id=" + Request.QueryString["ID"]);
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(CS))
            {
                SqlDataAdapter da = new SqlDataAdapter("DELETE FROM [images] WHERE path = '" + Request.Form["hiddenID"] + "'", conn);
                DataSet ds = new DataSet();
                da.Fill(ds);
            }
            Response.Redirect("images.aspx?id=" + Request.QueryString["ID"]);
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(CS))
            {
                SqlDataAdapter da = new SqlDataAdapter("UPDATE MyMags SET [image] = '" + Request.Form["hiddenID"] + "' WHERE ID = '" + Request.QueryString["ID"] + "'", conn);
                DataSet ds = new DataSet();
                da.Fill(ds);
            }
            Response.Redirect("MyMagazines.aspx");
        }
    }
}