using SelectPdf;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ControlPanel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
        conn.Open();
        var cmd = new SqlCommand();
        cmd.CommandText = "SELECT count(*) FROM MyMags WHERE Retired = 'N'";
        cmd.Connection = conn;
        var reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                magsActive.Value = reader.GetInt32(0).ToString();
            }
        }
        reader.Close();
        conn.Close();

        conn.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "SELECT count(*) FROM MyMags WHERE Retired = 'Y'";
        cmd.Connection = conn;
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                magsRetired.Value = reader.GetInt32(0).ToString();
            }
        }
        reader.Close();
        conn.Close();

        conn.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "SELECT count(*) FROM MyMags WHERE Posted = 'Y'";
        cmd.Connection = conn;
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                magsPosted.Value = reader.GetInt32(0).ToString();
            }
        }
        reader.Close();
        conn.Close();

        conn.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "SELECT count(*) FROM Profile";
        cmd.Connection = conn;
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                magUsers.Value = reader.GetInt32(0).ToString();
            }
        }
        reader.Close();
        conn.Close();

    }
}