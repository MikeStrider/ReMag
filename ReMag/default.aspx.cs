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
                ((HtmlAnchor)(FindControl("loginbtn"))).InnerText = "Log Out";
                ((HtmlAnchor)FindControl("loginbtn2")).InnerText = "Log Out";
                txtUserId.InnerText = (String)Session["LoggedIn"];
                ((HtmlAnchor)(FindControl("loginbtn"))).HRef = "#modal2";
                ((HtmlAnchor)(FindControl("loginbtn2"))).HRef = "#modal2";
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
                    SqlDataAdapter da = new SqlDataAdapter("INSERT INTO [Profile] (name, email, [password], image) VALUES (@username, @email, @password, @image)", conn);
                    da.SelectCommand.Parameters.AddWithValue("@email", email1.Value);
                    da.SelectCommand.Parameters.AddWithValue("@password", password1.Value);
                    da.SelectCommand.Parameters.AddWithValue("@username", username1.Value);
                    da.SelectCommand.Parameters.AddWithValue("@image", "/images/nopreview.png");
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    Session["LoggedIn"] = username1.Value;
                    Session["LoggedInID"] = GetUserID(username1.Value);
                    SendMail senderObject = new SendMail();
                    senderObject.SendEmailNow(email1.Value + ",mike.strong@live.ca", "Welcome to ReMag!",
                        "<h1>Welcome to ReMag!</h1> Sell you magazines and look for mags to buy.  You can buy single issues or sign up for monthly.<br/>" +
                        "You will need an account.  Once created you can update your Profile.<br/>" +
                        "The My Mags page allows you to post magazines.<br/>" + 
                        "Shop is a list of mags available to buy.<br/>" +
                        "All shipping is handled outside of the app.  All payment is handled outside of the app.<br/>" +
                        "Click here to go to the website now <a href=\"http://mstrong.ca:88\">http://mstrong.ca:88</a>.<br/><br/><br/>",
                        "", "");
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
                    Session["LoggedInID"] = GetUserID(username.Value);
                    Session["LoggedIn"] = username.Value;
                    MySharedClasses sharedObject = new MySharedClasses();
                    sharedObject.Log("UserID " + Session["LoggedIn"] + " - ClientID " + Request.UserHostAddress, Int32.Parse(Session["LoggedInID"].ToString()), "logged in");
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
            MySharedClasses sharedObject = new MySharedClasses();
            sharedObject.Log("UserID " + Session["LoggedIn"] + " - ClientID " + Request.UserHostAddress, Int32.Parse(Session["LoggedInID"].ToString()), "logged out");
            Session["LoggedIn"] = null;
            Response.Redirect("default.aspx?lo=Y");
        }

        protected string GetUserID (string userName)
        {
            string x = "nothing";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM Profile WHERE name = '" + userName + "'";
            cmd.Connection = conn;
            var reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    x = reader["ProfileID"].ToString();
                }
            }
            reader.Close();
            conn.Close();
            return x;
        }
    }
}