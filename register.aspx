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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text != TextBox3.Text)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password does not match')", true);
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
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Username or password already exist')", true);
            }
                
            else
            {
                query = "INSERT INTO login(uname, pwd) VALUES ('" + TextBox1.Text + "','" + TextBox2.Text + "')";
                OleDbCommand ins = new OleDbCommand(query, conn);
                ins.ExecuteNonQuery();
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Registration successful')", true);
                //User input
                //field empty
                //username already exist
                //login
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
