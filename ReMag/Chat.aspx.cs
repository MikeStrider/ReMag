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

public partial class Chat : System.Web.UI.Page
{
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
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter("INSERT INTO [Chat] (UserName, Text, UDDateTime) VALUES (@user, @chat, @datetime)", conn);
        da.SelectCommand.Parameters.AddWithValue("@User", (string)Session["LoggedIn"]);
        da.SelectCommand.Parameters.AddWithValue("@Chat", txt_chat.Value);
        da.SelectCommand.Parameters.AddWithValue("@datetime", DateTime.Now);
        DataSet ds = new DataSet();
        da.Fill(ds);
        Response.Redirect("Chat.aspx");
    }

    protected void Logout_ServerClick(object sender, EventArgs e)
    {
        Session["LoggedIn"] = null;
        Response.Redirect("default.aspx?lo=Y");
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}