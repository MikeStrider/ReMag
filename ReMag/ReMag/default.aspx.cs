using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReMag
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
  
        protected void Login_ServerClick(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ReMag-DBConnectionString"].ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("INSERT INTO [Profile] (email, [password]) VALUES (@email, @password)", conn);
            da.SelectCommand.Parameters.AddWithValue("@email", email1.Value);
            da.SelectCommand.Parameters.AddWithValue("@password", password1.Value);
            DataSet ds = new DataSet();
            da.Fill(ds);
            Session["LoggedIn"] = email1.Value;
        }
    }
}