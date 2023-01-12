using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SelectPdf;
using Patagames.Ocr;
using Patagames.Ocr.Enums;
using ImageProcessor.Imaging.Formats;
using System.Drawing;
using ImageProcessor;
using System.Net.Http;
using System.Net;
using System.Configuration;
using System.Drawing.Printing;
using iTextSharp.text.pdf;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;

public partial class ProcessClinicForms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnMakePDF_Click(object sender, EventArgs e)
    {

        //grab data from excel and add it to an object
        //loop thru first row and create PDF with data
        //loop till finished


        // Create a Document object
        var document = new Document(PageSize.A4, 50, 50, 25, 25);

        // Create a new PdfWrite object, writing the output to a MemoryStream
        var output = new MemoryStream();
        var writer = PdfWriter.GetInstance(document, output);

        // Open the Document for writing
        document.Open();

        // Read in the contents of the Receipt.htm HTML template file
        string contents = File.ReadAllText(Server.MapPath("~/ClinicForm.htm"));

        // Replace the placeholders with the user-specified text
        contents = contents.Replace("[ORDERDATE]", "sdfsdg");
        contents = contents.Replace("[BILLTO]", "aaaaaaaaaaaaaaa");
        //contents = contents.Replace("[BOOKEDBY]", bookedby.Text);
        //contents = contents.Replace("[TRUCK]", truck.Text);
        //contents = contents.Replace("[DRIVER]", driver.Text);
        //contents = contents.Replace("[PICKUPLOCATION]", pickuplocation.Text);
        //contents = contents.Replace("[DROPOFFLOCATION]", dropofflocation.Text);
        //contents = contents.Replace("[TOTALCHARGES]", totalcharges.Text);
        //contents = contents.Replace("[TOTALCHARGES2]", totalcharges.Text);
        //string newString = txtAddress.Text;
        //newString = newString.Replace("\r\n", "<br>");
        //contents = contents.Replace("[ADDRESS]", newString);
        //newString = txtCandTtext.Text;
        //newString = newString.Replace("\r\n", "<br>");
        //contents = contents.Replace("[TandC]", newString);

        // Uses iTextSharp and fills the PDF
        var parsedHtmlElements = HTMLWorker.ParseToList(new StringReader(contents), null);
        foreach (var htmlElement in parsedHtmlElements)
            document.Add(htmlElement as IElement);

        // Adds an image in the upper right corner
        //var logo = iTextSharp.text.Image.GetInstance(Server.MapPath("~/logos/" + (String)Session["mySessionVar2"] + "-logo.png"));
        //logo.SetAbsolutePosition(40, 680);
        //logo.ScaleToFit(170, 170);
        //document.Add(logo);

        //var logo3 = iTextSharp.text.Image.GetInstance(Server.MapPath("~/Images/line2.png"));
        //logo3.SetAbsolutePosition(12, 569);
        //logo.ScalePercent(80);
        //document.Add(logo3);

        //var logo2 = iTextSharp.text.Image.GetInstance(Server.MapPath("~/Images/line2.png"));
        //logo2.SetAbsolutePosition(12, 492);
        //logo.ScalePercent(80);
        //document.Add(logo2);

        document.Close();
        Response.ContentType = "application/pdf";
        Response.AddHeader("Content-Disposition", string.Format("attachment;filename=MikesTrucking-{0}.pdf", "filenamehere"));
        Response.BinaryWrite(output.ToArray());
    }
}