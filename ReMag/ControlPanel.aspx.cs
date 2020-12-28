using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
        cmd.CommandText = "SELECT * FROM Profile WHERE name = '" + (String)Session["LoggedIn"] + "'";
        cmd.Connection = conn;
        var reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                address.Value = reader["address"].ToString();
                email.Value = reader["email"].ToString();
            }
        }
        reader.Close();
        conn.Close();
    }
}