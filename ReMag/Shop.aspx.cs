using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ReMag
{
    public partial class Shop : System.Web.UI.Page
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
        protected void Logout_ServerClick(object sender, EventArgs e)
        {
            MySharedClasses sharedObject = new MySharedClasses();
            sharedObject.Log("UserID " + Session["LoggedIn"] + " - ClientID " + Request.UserHostAddress, Int32.Parse(Session["LoggedInID"].ToString()), "logged out");
            Session["LoggedIn"] = null;
            Response.Redirect("default.aspx?lo=Y");
        }
    }
}