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
    public partial class Login : System.Web.UI.Page
    {       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Enter username')", true);
            }
            if (TextBox2.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Enter password')", true);
            }

            string connect = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:/Users/Seetha/Documents/news.accdb";
            OleDbConnection conn = new OleDbConnection(connect);
            conn.Open();
            string query = "select uname,pwd from login where uname = '" + TextBox1.Text + "' AND pwd='" + TextBox2.Text + "'";
            OleDbCommand cmd = new OleDbCommand(query, conn);
            OleDbDataReader data = cmd.ExecuteReader();
            data.Read();
            if (data.HasRows)
            {
                Session["user"] = TextBox1.Text;
                Response.Redirect("Home.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid username or password')", true);
            }
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");

        }
    }
}
