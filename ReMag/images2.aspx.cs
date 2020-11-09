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
            var literal = new LiteralControl();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM images WHERE MagID = '" + Request.QueryString["ID"] + "'";
            cmd.Connection = conn;
            var reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                //int counting = 0;
                //string currentitem = "blahh";
                //while (reader.Read())
                //{
                //    counting = counting + 1;
                //    currentitem = reader["path"].ToString();
                //    literal.Text = literal.Text + "<div class='carousel-item'><img src='" + reader["path"].ToString() + "' /></div>";
                //}
                //if (counting == 2)
                //{
                //    literal.Text = literal.Text + "<div class='carousel-item'><img src='" + currentitem + "' /></div>";
                //}
                //if (counting == 1)
                //{
                //    literal.Text = literal.Text + "<div class='carousel-item'><img src='" + currentitem + "' /></div>";
                //    literal.Text = literal.Text + "<div class='carousel-item'><img src='" + currentitem + "' /></div>";
                //}
                while (reader.Read())
                {
                    literal.Text = literal.Text + "<img class='responsive-img materialboxed' width='300' src='" + reader["path"].ToString() + "' />";
                }

            }
            reader.Close();
            conn.Close();
            ImagePlaceHolder.Controls.Add(literal);

            conn.Open();
            cmd.CommandText = "SELECT * FROM MyMags JOIN Profile ON Profile.ID = MyMags.[user] WHERE MyMags.ID = '" + Request.QueryString["ID"] + "'";
            cmd.Connection = conn;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    details.Value = reader["description"].ToString();
                    title.Value = reader["title"].ToString();
                    lbl_contactme.Text = "<br> To purchase, contact " + reader["name"].ToString() + " by emailing " + reader["email"].ToString() + ".";
                }
            }
            reader.Close();
            conn.Close();
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
            else
            {
                Response.Redirect("images.aspx?up=N&id=" + Request.QueryString["ID"]);
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (IsImageLeftwithOne() == "true")
            {
                Response.Redirect("images.aspx?id=" + Request.QueryString["ID"] + "&nodelete=1");
            }
            else
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

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (Request.Form["hiddenID"].Contains("images"))
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

}