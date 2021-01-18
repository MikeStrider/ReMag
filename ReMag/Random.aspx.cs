using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SelectPdf;

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

    protected void btnMakePDF_Click(object sender, EventArgs e)
    {
        string url = txtMakePDF.Value;

        string pdf_page_size = "A4";
        PdfPageSize pageSize = (PdfPageSize)Enum.Parse(typeof(PdfPageSize),
            pdf_page_size, true);

        PdfPageOrientation pdfOrientation = (PdfPageOrientation)Enum.Parse(typeof(PdfPageOrientation), "Portrait", true);
        HtmlToPdf converter = new HtmlToPdf();
        converter.Options.PdfPageSize = pageSize;
        converter.Options.PdfPageOrientation = pdfOrientation;
        converter.Options.MarginBottom = 10;
        converter.Options.MarginLeft = 10;
        converter.Options.MarginRight = 10;
        converter.Options.MarginTop = 10;

        try
        {
            PdfDocument doc = converter.ConvertUrl(url);
            // if you want to save to file doc.Save(Server.MapPath("/Documents/document3.pdf"));
            doc.Save(Response, true, "document3.pdf");
            doc.Close();
        }
        catch (Exception ex)
        {
            // show the error model
            if (ex.Message != "Thread was being aborted.")
            {
                myModal.Style.Add("display", "block");
            }
        }
    }
}

public class JsonClass
{
    public string text { get; set; }
    public string author { get; set; }
}