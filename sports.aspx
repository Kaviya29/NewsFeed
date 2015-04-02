using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;

namespace NewsFeed
{
    public partial class sports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connect = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:/Users/Seetha/Documents/news.accdb";
            OleDbConnection conn = new OleDbConnection(connect);
            conn.Open();
            string query = "select content from cont where newsid=1001";
           // Response.Write(query);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            OleDbDataReader data = cmd.ExecuteReader();
            data.Read();
            String value = data.GetValue(0).ToString();
            Label1.Text = value;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string user = Session["user"].ToString();
            string connect = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:/Users/Seetha/Documents/news.accdb";
            OleDbConnection conn = new OleDbConnection(connect);
            conn.Open();
            string query = "insert into favorites(newsid,fav,uname1) values (1001, '" + Label1.Text + "', '" + user + "')";
            // Response.Write(query);
            OleDbCommand ins = new OleDbCommand(query, conn);
            ins.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Favourites added successful')", true);
        }
    }
}
