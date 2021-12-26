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
    public partial class MyMagazines : System.Web.UI.Page
    {
        string magID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedIn"] != null)
            {
                ((HtmlAnchor)(FindControl("loginbtn"))).InnerText = "Log Out";
                ((HtmlAnchor)FindControl("loginbtn2")).InnerText = "Log Out";
                txtUserId.InnerText = (String)Session["LoggedIn"];
                ((HtmlAnchor)(FindControl("loginbtn"))).HRef = "#modal2";
                ((HtmlAnchor)(FindControl("loginbtn2"))).HRef = "#modal2";
                ((HtmlAnchor)(FindControl("loginbtn"))).Attributes.Add("class", "waves-effect waves-light btn modal-trigger green lighten-2");
                ((HtmlAnchor)(FindControl("loginbtn2"))).Attributes.Add("class", "waves-effect waves-light btn modal-trigger green lighten-2");
            }
            else
            {
                Response.Redirect("default.aspx?dn=Y");
            }

            // retire mag
            if (!String.IsNullOrEmpty(Request.QueryString["ret"]))
            {
                magID = Request.QueryString["ret"];
                string CS = ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    SqlDataAdapter da = new SqlDataAdapter("UPDATE MyMags SET retired = 'Y', posted = 'N' WHERE MagID = '" + magID + "'", conn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                }
            }

            // unretire
            if (!String.IsNullOrEmpty(Request.QueryString["unret"]))
            {
                magID = Request.QueryString["unret"];
                string CS = ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    SqlDataAdapter da = new SqlDataAdapter("UPDATE MyMags SET retired = 'N', posted = 'N' WHERE MagID = '" + magID + "'", conn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                }
            }

            // post the mag
            if (!String.IsNullOrEmpty(Request.QueryString["pid"]))
            {
                magID = Request.QueryString["pid"];
                string CS = ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    SqlDataAdapter da = new SqlDataAdapter("UPDATE MyMags SET posted = 'Y' WHERE MagID = '" + magID + "'", conn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                }

                var x = "no title";
                var y = "no description";
                SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
                conn2.Open();
                var cmd = new SqlCommand();
                cmd.CommandText = "SELECT * FROM MyMags WHERE [MagID] = " + Request.QueryString["pid"];
                cmd.Connection = conn2;
                var reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        x = (string)reader["title"];
                        y = (string)reader["description"];
                    }
                }
                reader.Close();
                conn2.Close();

                SendMail senderObject = new SendMail();
                List<string> myList = senderObject.GetSubscribedEmails(); // adds all emails to a List<string>
                senderObject.SendNewMagEmailNow(myList,            // sends list to sender object
                    "New Mag available on ReMag",
                    "<h1>New Mag available on ReMag</h1>A user of Remag has posted a new magazine.  Go to <a href=\"http://mstrong.ca\">mstrong.ca</a> to view.<br><br><b>title:</b> " + x + "<br><b>description:</b> " + y,
                    Request.QueryString["pid"],
                    Session["LoggedIn"].ToString());

            }

            // unpost the mag
            if (!String.IsNullOrEmpty(Request.QueryString["uid"]))
            {
                magID = Request.QueryString["uid"];
                string CS = ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    SqlDataAdapter da = new SqlDataAdapter("UPDATE MyMags SET posted = 'N' WHERE MagID = '" + magID + "'", conn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                }
                MySharedClasses sharedObject = new MySharedClasses();
                sharedObject.Log("magID: " + magID, Int32.Parse(Session["LoggedInID"].ToString()), "mag un-posted");
            }
        }

        protected void Logout_ServerClick(object sender, EventArgs e)
        {
            MySharedClasses sharedObject = new MySharedClasses();
            sharedObject.Log("UserID " + Session["LoggedIn"] + " - ClientID " + Request.UserHostAddress, Int32.Parse(Session["LoggedInID"].ToString()), "logged out");
            Session["LoggedIn"] = null;
            Response.Redirect("default.aspx?lo=Y");
        }

        protected void AddNewMag_ServerClick(object sender, EventArgs e)
        {
            string SingleSub = "null";
            if (chksingle.Checked == true)
            {
                SingleSub = "Single Issue";
            }
            else
            {
                SingleSub = "Subscription";
            }
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("INSERT INTO [MyMags] (title, posted, [retired], description, [type], [user], [price], [image]) VALUES (@title, @posted, @retired, @description, @type, @user, @price, @image)", conn);
            da.SelectCommand.Parameters.AddWithValue("@title", txtTitle.Value);
            da.SelectCommand.Parameters.AddWithValue("@posted", "N");
            da.SelectCommand.Parameters.AddWithValue("@retired", "N");
            da.SelectCommand.Parameters.AddWithValue("@description", txtDescription.Value);
            da.SelectCommand.Parameters.AddWithValue("@type", SingleSub);
            da.SelectCommand.Parameters.AddWithValue("@user", (string)Session["LoggedInID"]);
            da.SelectCommand.Parameters.AddWithValue("@price", txtPrice.Value);
            da.SelectCommand.Parameters.AddWithValue("@image", "/images/nopreview.png");
            DataSet ds = new DataSet();
            da.Fill(ds);

            int magID = GetMagID((string)Session["LoggedInID"], txtTitle.Value);

            SqlDataAdapter da2 = new SqlDataAdapter("INSERT INTO [images] ([MagID], [path]) VALUES (@MagID, @path)", conn);
            da2.SelectCommand.Parameters.AddWithValue("@MagID", magID);
            da2.SelectCommand.Parameters.AddWithValue("@path", "/images/nopreview.png");
            DataSet ds2 = new DataSet();
            da2.Fill(ds2);

            MySharedClasses sharedObject = new MySharedClasses();
            sharedObject.Log("title: " + txtTitle.Value, Int32.Parse(Session["LoggedInID"].ToString()), "new mag added");

            Response.Redirect("MyMagazines.aspx?ad=Y");
        }

        protected void itemSelected(object sender, EventArgs e)
        {
            Label1.InnerHtml = ddl_Retired.SelectedValue;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[5].Text == "Y")
                {
                    HyperLink hyp = new HyperLink();
                    hyp.ID = "unPostBtn";
                    hyp.NavigateUrl = "~/MyMagazines.aspx?uid=" + e.Row.Cells[0].Text + "&psd=N";
                    hyp.Text = "unpost";
                    hyp.CssClass = "waves-effect waves-light btn";
                    e.Row.Cells[8].Controls.Add(hyp);
                } else {
                    HyperLink hyp = new HyperLink();
                    hyp.ID = "unPostBtn";
                    hyp.NavigateUrl = "~/MyMagazines.aspx?pid=" + e.Row.Cells[0].Text + "&psd=Y";
                    hyp.Text = "post";
                    hyp.CssClass = "waves-effect waves-light btn";
                    e.Row.Cells[8].Controls.Add(hyp);
                }

                if (e.Row.Cells[6].Text == "Y")
                {
                    HyperLink hyp = new HyperLink();
                    hyp.ID = "unRetireBtn";
                    hyp.NavigateUrl = "~/MyMagazines.aspx?unret=" + e.Row.Cells[0].Text;
                    hyp.Text = "unretire";
                    hyp.CssClass = "waves-effect waves-light btn";
                    e.Row.Cells[9].Controls.Add(hyp);
                } else {
                    HyperLink hyp = new HyperLink();
                    hyp.ID = "retireBtn";
                    hyp.NavigateUrl = "~/MyMagazines.aspx?ret=" + e.Row.Cells[0].Text;
                    hyp.Text = "retire";
                    hyp.CssClass = "waves-effect waves-light btn";
                    e.Row.Cells[9].Controls.Add(hyp);
                }
            }
        }
        protected int GetMagID(string userName, string title)
        {
            int x = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM MyMags WHERE [user] = " + userName + " and title = '" + title + "'";
            cmd.Connection = conn;
            var reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    x = (int)reader["MagID"];
                }
            }
            reader.Close();
            conn.Close();
            return x;
        }
    }
}