using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Constr"]);
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        //try
        //{
        //    con.Open();
        //    string query = "Insert into msg values('" + uname.Value + "','" + eml.Value + "','" + sub.Value + "','" + msg.Value + "')";
        //    SqlCommand cmd = new SqlCommand(query, con);
        //    cmd.ExecuteNonQuery();
        //    con.Close();
        if(uname.Value=="" && frmemail.Value=="" && sub.Value==""&& msg.Value=="")
        {
            Response.Write("<script>alert('Enter all Fields')</script>");
        }
        else
        { 
            try
            {
                MailMessage m = new MailMessage("jacksparrow8861@gmail.com", eml.Value,frmemail.Value,"Subject is--" + sub.Value + " and Message is--" + msg.Value);

                SmtpClient s = new SmtpClient("smtp.gmail.com", 587);
                s.Credentials = new System.Net.NetworkCredential("jacksparrow8861@gmail.com", "blackpearl@123");
                s.EnableSsl = true;
                s.Send(m);
            Resetter();
        }

            catch (Exception ex)
            {

            }
        }

        //}
        //catch (Exception ex)
        //{
        //}
        //finally
        //{

        //}

    }
    protected void Reset(object sender, EventArgs e)
    {
        Resetter();
    }
    void Resetter()
        {
        Response.Redirect("contact.aspx");
    }
}