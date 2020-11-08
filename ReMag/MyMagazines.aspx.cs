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
                Label1.Style["display"] = "none";
            }
            else
            {
                Response.Redirect("default.aspx?dn=Y");
            }

            if (!String.IsNullOrEmpty(Request.QueryString["id"]))
            {
                string CS = ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    SqlDataAdapter da = new SqlDataAdapter("UPDATE MyMags SET retired = 'Y' WHERE ID = '" + Request.QueryString["id"] + "'", conn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                }
            }
            if (!String.IsNullOrEmpty(Request.QueryString["pid"]))
            {
                string CS = ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    SqlDataAdapter da = new SqlDataAdapter("UPDATE MyMags SET posted = 'Y' WHERE ID = '" + Request.QueryString["pid"] + "'", conn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                }
            }

        }

        protected void Logout_ServerClick(object sender, EventArgs e)
        {
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

            SqlDataAdapter da2 = new SqlDataAdapter("INSERT INTO [images] ([MagID], [path]) VALUES (@ID, @path)", conn);
            da2.SelectCommand.Parameters.AddWithValue("@ID", magID);
            da2.SelectCommand.Parameters.AddWithValue("@path", "/images/nopreview.png");
            DataSet ds2 = new DataSet();
            da2.Fill(ds2);


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
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    if(e.Row.Cells[5].Text == "Y")
            //    {
            //        //HyperLink hyp = new HyperLink();
            //        //hyp.ID = "hypID";
            //        //hyp.NavigateUrl = e.Row.Cells[1].Text;
            //        //hyp.Text = "post load";
            //        //e.Row.Cells[8].Controls.Add(hyp);

            //        Image imgg = new Image();
            //        imgg.ID = "imageID";
            //        imgg.ImageUrl = e.Row.Cells[1].Text;
            //        imgg.Width = 100;
            //        e.Row.Cells[8].Controls.Add(imgg);


            //    }
            //}
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
                    x = (int)reader["ID"];
                }
            }
            reader.Close();
            conn.Close();
            return x;
        }
    }
}