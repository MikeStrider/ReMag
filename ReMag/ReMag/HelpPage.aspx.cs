using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ReMag
{
    public partial class HelpPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedIn"] != null)
            {
                ((HtmlAnchor)(FindControl("loginbtn"))).Attributes.Add("class", "disabled");
                loginbtn.InnerText = (String)Session["LoggedIn"];
                ((HtmlAnchor)(FindControl("loginbtn2"))).Attributes.Add("class", "disabled");
                loginbtn2.InnerText = (String)Session["LoggedIn"];
            }

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}