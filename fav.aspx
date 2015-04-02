
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
    public partial class fav : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string user = Session["user"].ToString();
            string connect = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:/Users/Seetha/Documents/news.accdb";
            OleDbConnection conn = new OleDbConnection(connect);
            conn.Open();
            string query = " select pname,content,img  from cont left join favorites on favorites.newsid = cont.newsid where favorites.uname1 = '" + user + "'";
            // Response.Write(query);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            OleDbDataReader data = cmd.ExecuteReader();
            String value = "";
            while (data.Read())
            {
                value = "<h3>" + data.GetValue(0).ToString()+"</h3><br>"+ data.GetValue(1).ToString();
                Label1.Text += value +"<img src='pictures/"+ data.GetValue(2).ToString()+"'><br><br><br>";

            }
        }
    }
}
