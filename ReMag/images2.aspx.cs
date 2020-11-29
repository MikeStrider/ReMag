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


    public partial class images2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string imageOwner = "0";
            List<string> imageIDs = new List<string>();
            List<string> paths = new List<string>();
            var literal = new LiteralControl();
            var literalDeleteImage = new LiteralControl();
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
                    literal.Text = literal.Text + "<img class='responsive-img materialboxed' width='300' src='" + reader["path"].ToString() + "' />";
                    imageIDs.Add(reader["imageID"].ToString());
                    paths.Add(reader["path"].ToString());
                }

            }
            reader.Close();
            conn.Close();
            ImagePlaceHolder.Controls.Add(literal);

            // if mag owner do things
            conn.Open();
            cmd.CommandText = "SELECT * FROM MyMags JOIN Profile ON Profile.ProfileID = MyMags.[user] WHERE MyMags.MagID = '" + Request.QueryString["ID"] + "'";
            cmd.Connection = conn;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    details.Value = reader["description"].ToString();
                    title.Value = reader["title"].ToString();
                    imageOwner = reader["user"].ToString();
                    if (imageOwner != Session["LoggedInID"].ToString())
                    {
                        lbl_contactme.Text = "<br> To purchase, contact " + reader["name"].ToString() + " by emailing " + reader["email"].ToString() + ".";
                    } else
                    {
                        lbl_contactme.Text = "You own this magazine.";
                        var imageCounter = 0;
                        for (var x = 0; x < imageIDs.Count ; x++)
                        {
                            imageCounter = imageCounter + 1;
                            literalDeleteImage.Text = literalDeleteImage.Text + " / <a href = 'images2.aspx?id=" + Request.QueryString["ID"] + "&deleteme=" + imageIDs[x] + "'>Delete Image " + imageCounter + 
                                "</a> / <a href = 'images2.aspx?id=" + Request.QueryString["ID"] + "&setPrim=" + paths[x] + "'>Set Image " + imageCounter + " as Primary </a>";
                        }
                        PlaceHolder2.Controls.Add(literalDeleteImage);
                    }
                }
            }
            reader.Close();
            conn.Close();

            // delete the mag image
            if (!String.IsNullOrEmpty(Request.QueryString["deleteme"]))
            {
                if (IsImageLeftwithOne() == "true")
                {
                    Response.Redirect("images2.aspx?id=" + Request.QueryString["ID"] + "&nodelete=1");
                }
                else
                {
                    string CS = ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString;
                    using (SqlConnection conn2 = new SqlConnection(CS))
                    {
                        SqlDataAdapter da = new SqlDataAdapter("DELETE FROM [images] WHERE ImageID = '" + Request.QueryString["deleteme"] + "'", conn2);
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                    }
                    Response.Redirect("images2.aspx?id=" + Request.QueryString["ID"]);
                }
            }

            // set as primary
            if (!String.IsNullOrEmpty(Request.QueryString["setPrim"]))
            {
                string CS = ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString;
                using (SqlConnection conn2 = new SqlConnection(CS))
                {
                    SqlDataAdapter da = new SqlDataAdapter("UPDATE MyMags SET [image] = '" + Request.QueryString["setPrim"] + "' WHERE MagID = '" + Request.QueryString["ID"] + "'", conn2);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                }
                Response.Redirect("MyMagazines.aspx");
            }
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
                Response.Redirect("images2.aspx?up=Y&id=" + Request.QueryString["ID"]);
            }
            else
            {
                Response.Redirect("images2.aspx?up=N&id=" + Request.QueryString["ID"]);
            }
        }

        protected string IsImageLeftwithOne()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
            using (SqlCommand sqlCommand = new SqlCommand("SELECT COUNT(*) from images WHERE MagID = @MagID", conn))
            {
                conn.Open();
                sqlCommand.Parameters.AddWithValue("@MagID", Request.QueryString["ID"]);
                int userCount = (int)sqlCommand.ExecuteScalar();
                if (userCount > 1)
                {
                    return "false";
                }
                else
                {
                    return "true";
                }
            }
        }
    }
}