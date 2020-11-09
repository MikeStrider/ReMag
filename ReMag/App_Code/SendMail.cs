using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

public class SendMail
{

    public List<string> GetSubscribedEmails()
    {
        List<string> strList = new List<string>();

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
        conn.Open();
        var cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM [Profile] WHERE getnewmags = 'Y'";
        cmd.Connection = conn;
        var reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                strList.Add(reader["email"].ToString());
            }
        }
        reader.Close();
        conn.Close();
        return strList;
    }

    public void SendNewMagEmailNow(List<string> sendto, string subject, string body, string magID, string userID)
    {
        foreach (string to in sendto)
        {
            if (to == null || to == "")
            {
                // do nothing 
            }
            else if (to.Contains("@"))
            {
                using (MailMessage mm = new MailMessage("noreply.remag@gmail.com", to))
                {
                    mm.Subject = subject;
                    mm.Body = body;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    mm.IsBodyHtml = true;
                    NetworkCredential networkcred = new NetworkCredential("noreply.remag@gmail.com", "remag12#$");
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = networkcred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                }
            }
        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter("INSERT INTO [Logging] ([UDDateTime], [Type], [Info], UserName) VALUES (@datetime, @type, @info, @UserName)", conn);
        da.SelectCommand.Parameters.AddWithValue("@datetime", DateTime.Now.ToString("MM-dd-yyyy h:mm:ss tt"));
        da.SelectCommand.Parameters.AddWithValue("@type", "mag posted");
        da.SelectCommand.Parameters.AddWithValue("@info", "magID: " + magID);
        da.SelectCommand.Parameters.AddWithValue("@UserName", userID);
        DataSet ds = new DataSet();
        da.Fill(ds);
        conn.Close();
    }
}