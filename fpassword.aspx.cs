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
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

   

   

    protected void Button2_Click(object sender, EventArgs e)
    {
      
        {
            SqlConnectionValidator.Connection connector = new SqlConnectionValidator.Connection();
            if (connector.isChecker())
            {
                if (TextBox1.Text.Equals(string.Empty) )
                {
                    Response.Write("<script>alert('Please enter the email!!!');</script>");
                }
                else
                {
                    
                    {
                        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Constr"]);
                        try
                        {
                            //bool flag = false;
                            con.Open();
                            string query = "select Email,Pswd from Userdata where Uname='" + TextBox1.Text + "'; ";
                            SqlCommand cmd = new SqlCommand(query, con);
                            SqlDataReader dr = cmd.ExecuteReader();
                            if (dr.HasRows)
                            {
                                while (dr.Read())
                                {
                                    string em = dr.GetValue(0).ToString();
                                    string pd = dr.GetValue(1).ToString();

                                    try
                                    {
                                        MailMessage m = new MailMessage("mpchethan456@gmail.com", em, "Password Recovery Email", "You Password is " + pd);

                                        SmtpClient s = new SmtpClient("smtp.gmail.com", 587);
                                        s.Credentials = new System.Net.NetworkCredential("mpchethan456@gmail.com", "Qwerty@123");
                                        s.EnableSsl = true;
                                        s.Send(m);
                                    }
                                    catch (Exception ex)
                                    {

                                    }

                                }
                            }
                            dr.Close();
                        }
                        catch(Exception ex)
                        {
                        }
                        finally
                        {
                            con.Close();
                        }
                    }
                }
            }
        }
    }

    
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}