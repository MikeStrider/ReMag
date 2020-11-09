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
                ((HtmlAnchor)(FindControl("loginbtn"))).InnerText = (String)Session["LoggedIn"];
                ((HtmlAnchor)(FindControl("loginbtn2"))).InnerText = (String)Session["LoggedIn"];
                ((HtmlAnchor)(FindControl("loginbtn"))).HRef = "#modal2";
                ((HtmlAnchor)(FindControl("loginbtn2"))).HRef = "#modal2";
                ((HtmlAnchor)(FindControl("loginbtn"))).Attributes.Add("class", "waves-effect waves-light btn modal-trigger green lighten-2");
                ((HtmlAnchor)(FindControl("loginbtn2"))).Attributes.Add("class", "waves-effect waves-light btn modal-trigger green lighten-2");
            } else
            {
                Response.Redirect("default.aspx?dn=Y");
            }

            if (!IsPostBack)
            {
                var isChecked = "N";
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
                        telephone.Value = reader["telephone"].ToString();
                        city.Value = reader["city"].ToString();
                        zip.Value = reader["zip"].ToString();
                        isChecked = reader["getnewmags"].ToString();
                    }
                }
                reader.Close();
                conn.Close();
                if (isChecked == "Y")
                {
                    chk_emailme.Checked = true;
                }
            }
        }

        protected void Save_ServerClick(object sender, EventArgs e)
        {
            string isChecked;
            if (chk_emailme.Checked == true)
            {
                isChecked = "Y";
            } else {
                isChecked = "N";
            }
            string CS = ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(CS))
            {
                SqlDataAdapter da = new SqlDataAdapter("UPDATE Profile SET email = @email, telephone = @telephone, name = @name, address = @address, city = @city, zip = @zip, bio = @bio, getnewmags = @getnewmags WHERE name = '" + (String)Session["LoggedIn"] + "'", conn);
                da.SelectCommand.Parameters.AddWithValue("@name", name.Value);
                da.SelectCommand.Parameters.AddWithValue("@email", email.Value);
                da.SelectCommand.Parameters.AddWithValue("@telephone", telephone.Value);
                da.SelectCommand.Parameters.AddWithValue("@address", address.Value);
                da.SelectCommand.Parameters.AddWithValue("@city", city.Value);
                da.SelectCommand.Parameters.AddWithValue("@zip", zip.Value);
                da.SelectCommand.Parameters.AddWithValue("@bio", bio.Value);
                da.SelectCommand.Parameters.AddWithValue("@getnewmags", isChecked);
                DataSet ds = new DataSet();
                da.Fill(ds);
            }
            Response.Redirect("UserProfile.aspx?sc=Y");
        }

        protected void Logout_ServerClick(object sender, EventArgs e)
        {
            Session["LoggedIn"] = null;
            Response.Redirect("default.aspx?lo=Y");
        }
    }
}