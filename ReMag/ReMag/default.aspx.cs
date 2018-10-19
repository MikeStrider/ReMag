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
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedIn"] != null) {
                loginbtn.InnerText = (String)Session["LoggedIn"];
                loginbtn2.InnerText = (String)Session["LoggedIn"];
                loginbtn.HRef = "#modal2";
                loginbtn2.HRef = "#modal2";
                ((HtmlAnchor)(FindControl("loginbtn"))).Attributes.Add("class", "waves-effect waves-light btn modal-trigger green lighten-2");
                ((HtmlAnchor)(FindControl("loginbtn2"))).Attributes.Add("class", "waves-effect waves-light btn modal-trigger green lighten-2");
            }
        }
  
        protected void Register_ServerClick(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
            using (SqlCommand sqlCommand = new SqlCommand("SELECT COUNT(*) from Profile WHERE name = @name or email = @email", conn))
            {
                conn.Open();
                sqlCommand.Parameters.AddWithValue("@name", username1.Value);
                sqlCommand.Parameters.AddWithValue("@email", password1.Value);
                int userCount = (int)sqlCommand.ExecuteScalar();
                if (userCount > 0)
                {
                    Response.Redirect("default.aspx?ex=Y");
                }
                else {
                    SqlDataAdapter da = new SqlDataAdapter("INSERT INTO [Profile] (name, email, [password]) VALUES (@username, @email, @password)", conn);
                    da.SelectCommand.Parameters.AddWithValue("@email", email1.Value);
                    da.SelectCommand.Parameters.AddWithValue("@password", password1.Value);
                    da.SelectCommand.Parameters.AddWithValue("@username", username1.Value);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    Session["LoggedIn"] = username1.Value;
                    Response.Redirect("default.aspx?reg=Y");
                }
            }
        }

        protected void Login_ServerClick(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
            using (SqlCommand sqlCommand = new SqlCommand("SELECT COUNT(*) from Profile WHERE name = @name AND password = @password", conn))
            {
                conn.Open();
                sqlCommand.Parameters.AddWithValue("@name", username.Value);
                sqlCommand.Parameters.AddWithValue("@password", password.Value);
                int userCount = (int)sqlCommand.ExecuteScalar();
                if (userCount > 0)
                {
                    SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
                    conn2.Open();
                    var cmd2 = new SqlCommand();
                    cmd2.CommandText = "SELECT * FROM Profile WHERE name = '" + username.Value + "'";
                    cmd2.Connection = conn;
                    var reader = cmd2.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            Session["LoggedInID"] = reader["ID"].ToString();
                        }
                    }
                    reader.Close();
                    conn2.Close();
                    Session["LoggedIn"] = username.Value;
                    Response.Redirect("default.aspx?ln=Y");
                }
                else
                {
                    Response.Redirect("default.aspx?lf=Y");
                }
            }
        }

        protected void Logout_ServerClick(object sender, EventArgs e)
        {
            Session["LoggedIn"] = null;
            Response.Redirect("default.aspx?lo=Y");
        }
    }
}