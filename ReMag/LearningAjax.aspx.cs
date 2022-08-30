using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Blogs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string GetCurrentTime(string name)
    {
        return "Hello " + name + Environment.NewLine + "The Current Time is: " + DateTime.Now.ToString() + Environment.NewLine + 
            "And this data is from c#.  Possibly its your data from the database.";
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "Hello " + txtUserName.Text + "<br> The Current Time is: " + DateTime.Now.ToString() + "<br>And this data is from c#.  Possibly its your data from the database.";
        ClientScript.RegisterClientScriptBlock(this.GetType(), "", "window.onload=function(){window.scrollTo(0,document.body.scrollHeight)};", true);
    }
}