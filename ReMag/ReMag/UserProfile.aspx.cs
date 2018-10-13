using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ReMag
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedIn"] != null)
            {
                ((HtmlAnchor)(FindControl("loginbtn"))).Attributes.Add("class", "disabled");
                loginbtn.InnerText = (String)Session["LoggedIn"];
                ((HtmlAnchor)(FindControl("loginbtn2"))).Attributes.Add("class", "disabled");
                loginbtn2.InnerText = (String)Session["LoggedIn"];
            } else
            {
                Response.Redirect("default.aspx?dn=Y");
            }

            if (!IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
                conn.Open();
                var cmd = new SqlCommand();
                cmd.CommandText = "SELECT * FROM Profile WHERE name = '" + (String)Session["LoggedIn"] + "'";
                cmd.Connection = conn;
                var reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        address.Value = reader["address"].ToString();
                        email.Value = reader["email"].ToString();
                        name.Value = reader["name"].ToString();
                        bio.Value = reader["bio"].ToString();
                        telephone.Value = reader["phone"].ToString();
                        city.Value = reader["city"].ToString();
                        zip.Value = reader["zip"].ToString();
                    }
                }
                reader.Close();
                conn.Close();
            }
        }

        protected void Save_ServerClick(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(CS))
            {
                SqlDataAdapter da = new SqlDataAdapter("UPDATE Profile SET email = @email, phone = @phone, name = @name, address = @address, city = @city, zip = @zip, bio = @bio WHERE name = '" + (String)Session["LoggedIn"] + "'", conn);
                da.SelectCommand.Parameters.AddWithValue("@name", name.Value);
                da.SelectCommand.Parameters.AddWithValue("@email", email.Value);
                da.SelectCommand.Parameters.AddWithValue("@phone", telephone.Value);
                da.SelectCommand.Parameters.AddWithValue("@address", address.Value);
                da.SelectCommand.Parameters.AddWithValue("@city", city.Value);
                da.SelectCommand.Parameters.AddWithValue("@zip", zip.Value);
                da.SelectCommand.Parameters.AddWithValue("@bio", bio.Value);
                DataSet ds = new DataSet();
                da.Fill(ds);
            }
            Response.Redirect("UserProfile.aspx?sc=Y");
        }
    }
}