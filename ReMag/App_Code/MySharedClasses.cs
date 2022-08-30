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

    public void Log(string info, int userID, string type)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter("INSERT INTO [Logging] ([UDDateTime], [Type], [Info], UserID) VALUES (@datetime, @type, @info, @UserID)", conn);
        da.SelectCommand.Parameters.AddWithValue("@datetime", DateTime.Now.ToString("MM-dd-yyyy h:mm:ss tt"));
        da.SelectCommand.Parameters.AddWithValue("@type", type);
        da.SelectCommand.Parameters.AddWithValue("@info", info);
        da.SelectCommand.Parameters.AddWithValue("@UserID", userID);
        DataSet ds = new DataSet();
        da.Fill(ds);
        conn.Close();
    }
}

public static class Globals
{
    public static string emailPassword = "zxxymxeekjidynes"; // old remag12#$
    public static string masterPassword = "mikemike";
}