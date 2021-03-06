﻿using System;
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
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM images WHERE MagID = '" + Request.QueryString["id"] + "'";
            cmd.Connection = conn;
            var reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                int counting = 0;
                string currentitem = "blahh";
                while (reader.Read())
                {
                    counting = counting + 1;
                    currentitem = reader["path"].ToString();
                    literal.Text = literal.Text + "<div class='carousel-item'><img src='" + reader["path"].ToString() + "' /></div>";
                }
                if (counting == 2 )
                {
                    literal.Text = literal.Text + "<div class='carousel-item'><img src='" + currentitem + "' /></div>";
                }
                if (counting == 1)
                {
                    literal.Text = literal.Text + "<div class='carousel-item'><img src='" + currentitem + "' /></div>";
                    literal.Text = literal.Text + "<div class='carousel-item'><img src='" + currentitem + "' /></div>";
                }
            }
            reader.Close();
            conn.Close();
            ImagePlaceHolder.Controls.Add(literal);

            conn.Open();
            cmd.CommandText = "SELECT * FROM MyMags WHERE MagID = '" + Request.QueryString["id"] + "'";
            cmd.Connection = conn;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    details.Value = reader["description"].ToString();
                    title.Value = reader["title"].ToString();
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
                SqlDataAdapter da = new SqlDataAdapter("INSERT INTO [images] (MagID, path) VALUES (@MagID, @path)", conn);
                da.SelectCommand.Parameters.AddWithValue("@MagID", Request.QueryString["id"]);
                da.SelectCommand.Parameters.AddWithValue("@path", "/images/" + filename);
                DataSet ds = new DataSet();
                da.Fill(ds);
                FileUploadControl.SaveAs(Server.MapPath("/images/") + filename);
                Response.Redirect("images.aspx?up=Y&id=" + Request.QueryString["id"]);
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
            Response.Redirect("images.aspx?id=" + Request.QueryString["id"]);
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(CS))
            {
                SqlDataAdapter da = new SqlDataAdapter("UPDATE MyMags SET [image] = '" + Request.Form["hiddenID"] + "' WHERE MagID = '" + Request.QueryString["id"] + "'", conn);
                DataSet ds = new DataSet();
                da.Fill(ds);
            }
            Response.Redirect("MyMagazines.aspx");
        }
    }
}