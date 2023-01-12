using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Threading;
using System.IO;
using System.Security.Permissions;
using System.Threading.Tasks;
using System.Runtime.InteropServices.ComTypes;
using System.Text;

public partial class Blogs : System.Web.UI.Page
{
    public static string complexValue;
    protected void Page_Load(object sender, EventArgs e)
    {
        complexValue = "something from c#";
    }

    [WebMethod]
    public static string GetCurrentTime(string name)
    {
        // can to more complex things here if needed, for example pull data from a database
        return "Hello " + name + Environment.NewLine + "The Current Time is: " + DateTime.Now.ToString() + Environment.NewLine +
            "And this data is from c#.  Possibly its your data from the database.";
    }

    private void CountCharacters()
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Thread t1 = new Thread(new ThreadStart(CountCharacters));
        t1.Start();
        Thread t2 = new Thread(new ThreadStart(CountCharacters));
        t2.Start();
    }

}