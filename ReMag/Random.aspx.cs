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
                lblErrorMsg.Text = "Problem creating PDF. URL is invalid.<br>" + ex.Message;
                myModal.Style.Add("display", "block");
            }
        }
    }

    protected void btnGrabText_Click(object sender, EventArgs e)
    {
        if (FileUploadControl.HasFile)
        {
            try
            {
                string filename = Path.GetFileName(FileUploadControl.FileName);
                FileUploadControl.SaveAs(Server.MapPath("/uploads/") + filename);
                var path = Server.MapPath("/uploads/") + filename;
                OcrApi.PathToEngine = @"C:\inetpub\wwwroot\ReMag\packages\Tesseract.Net.SDK.4.5.411\build\x64\tesseract.dll";
                using (var api = OcrApi.Create())
                {
                    api.Init(Languages.English);
                    string plainText = api.GetTextFromImage(path);
                    txtYourText.Text = plainText;
                }
            } catch (Exception ex)
            {
                lblErrorMsg.Text = "Trial Version - Image must be less then 500px by 500px.<br>" + ex.Message;
                myModal.Style.Add("display", "block");
            }
        }
    }

    protected void btnResize_Click(object sender, EventArgs e)
    {
        string filename = Path.GetFileName(FileUpload1.FileName);
        FileUpload1.SaveAs(Server.MapPath("/resize/") + filename);
        var path = Server.MapPath("/resize/") + filename;
        byte[] photoBytes = File.ReadAllBytes(path);
        // Format is automatically detected though can be changed.
        ISupportedImageFormat format = new JpegFormat { Quality = 70 };
        Size size = new Size(499, 499);
        using (MemoryStream inStream = new MemoryStream(photoBytes))
        {
            using (MemoryStream outStream = new MemoryStream())
            {
                // Initialize the ImageFactory using the overload to preserve EXIF metadata.
                using (ImageFactory imageFactory = new ImageFactory(preserveExifData:true))
                {
                    // Load, resize, set the format and quality and save an image.
                    imageFactory.Load(inStream)
                                .Resize(size)
                                .Format(format)
                                .Save(path);
                }
            }
        }
        byte[] fileByteArray = File.ReadAllBytes(Path.Combine(System.Web.Hosting.HostingEnvironment.ApplicationPhysicalPath, path));
        Response.AddHeader("Content-disposition", String.Format("attachment; filename={0}", "resized." + filename));
        Response.ContentType = "application/octet-stream";
        Response.BinaryWrite(fileByteArray);
    }

}

public class JsonClass
{
    public string text { get; set; }
    public string author { get; set; }
}