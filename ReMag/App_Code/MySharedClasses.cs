using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Xml.Linq;

public class MySharedClasses
{
    public string PublicFunction()
    {
        return "hello";
    }

    public void Log(string info, string userName, string type)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter("INSERT INTO [Logging] ([UDDateTime], [Type], [Info], UserName) VALUES (@datetime, @type, @info, @UserName)", conn);
        da.SelectCommand.Parameters.AddWithValue("@datetime", DateTime.Now.ToString("MM-dd-yyyy h:mm:ss tt"));
        da.SelectCommand.Parameters.AddWithValue("@type", type);
        da.SelectCommand.Parameters.AddWithValue("@info", "magID: " + info);
        da.SelectCommand.Parameters.AddWithValue("@UserName", userName);
        DataSet ds = new DataSet();
        da.Fill(ds);
        conn.Close();
    }
}

static class Globals
{
    public static string emailPassword = "remag12#$";
}