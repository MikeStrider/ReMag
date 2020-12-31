using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

public partial class Random : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        JArray o1 = JArray.Parse(File.ReadAllText(Server.MapPath("quotes.json")));
        List<JsonClass> yourJsonClassList = JsonConvert.DeserializeObject<List<JsonClass>>(o1.ToString());

        System.Random rnd = new System.Random();
        int x = rnd.Next(0,1642);
        divQuote.InnerText = yourJsonClassList[x].text + " - " + yourJsonClassList[x].author;


    }
}

public class JsonClass
{
    public string text { get; set; }
    public string author { get; set; }
}