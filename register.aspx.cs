using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Random r = new Random();
        TextBox1.Text = NameTB.Text + r.Next(345, 234555).ToString();
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        DateTime d1 = DateTime.Now;
        DateTime d2 = Convert.ToDateTime(dt1.Text);
        TimeSpan difference = d1.Subtract(d2);
        double age=(difference.TotalDays / 365.25);
        TextBox2.Text = Convert.ToInt32(Math.Round(age, 1)).ToString();
    }

   

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnectionValidator.Connection connector = new SqlConnectionValidator.Connection();
        if(connector.isChecker())        
        {
            // Step 1 - Identify db path
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Constr"]);

            // Step 2 - Open connection
            con.Open();

            // Step 3 - Build Query
            string query = "Insert into Userdata values('" + NameTB.Text + "','"+email.Text+"','" + dt1.Text+ "','" + TextBox2.Text + "','" + Request.Form["TextBox1"] + "','" + PasswordTb.Text + "')";

            // Step 4 - Perform operations
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();


            // Step 5 - Close connection
            con.Close();
            try
            {
                MailMessage m = new MailMessage("mpchethan456@gmail.com", email.Text, "Welcome to my application", "You Username is " + Request.Form["TextBox1"] + " and Password is " + PasswordTb.Text);

                SmtpClient s = new SmtpClient("smtp.gmail.com", 587);
                s.Credentials = new System.Net.NetworkCredential("mpchethan456@gmail.com", "Qwerty@123");
                s.EnableSsl = true;
                s.Send(m);
            }
            catch(Exception ex)
            {

            }

            try
            {

                string sUserID = "SunnyBoyka";
                string sPwd = "564715";
                string sNumber = "91"+phone.Text;
                string sSID = "SMSSEN";
                string sMessage = "Your Username is " + Request.Form["TextBox1"] + " and Password is " + PasswordTb.Text;
                string sURL = "http://smslane.com/vendorsms/pushsms.aspx?user=" + sUserID + "&password=" + sPwd + "&msisdn=" + sNumber + "&sid=" + sSID + "&msg=" + sMessage + "&mt=0&fl=0";
                http://smslane.com/vendorsms/pushsms.aspx?user=SunnyBoyka&password=564715&msisdn=919148547460&sid=WEBSMS&msg=Test&mt=0&fl=0
                
                string sResponse = GetResponse(sURL);
                //return sResponse;

            }
            catch
            {

            }
            //MailMessage mm = new MailMessage("@gmail.com", textBox1.Text, "Your Password for the wpf application", "Your password is:" + dr.GetValue(0).ToString());
            //SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            //System.Net.NetworkCredential nc = new System.Net.NetworkCredential("@gmail.com", "");
            //smtp.UseDefaultCredentials = false;
            ////smtp.Port = 587;
            //smtp.EnableSsl = true;
            //smtp.Credentials = nc;
            //smtp.Send(mm);

            // MySqlConnection con = new MySqlConnection(@"server=localhost;User Id=root;pwd=;Persist Security Info=True;database=demoasp");



            // MySqlConnection con = new MySqlConnection("Server=182.50.133.84;User Id=MysqlRoot;Password=rKan92*2;Database=demodb;Port=3306");


            Response.Write("<script>alert('Data Saved Successfully');</script>");

            Response.Write("<script>window.location='register.aspx';</script>");

            // Response.Redirect("Registration.aspx");
        }
    }






public static string GetResponse(string sURL)
{
    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(sURL);
    request.MaximumAutomaticRedirections = 4;
    request.Credentials = CredentialCache.DefaultCredentials;
    try
    {
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        Stream receiveStream = response.GetResponseStream();
        StreamReader readStream = new StreamReader(receiveStream, Encoding.UTF8);
        string sResponse = readStream.ReadToEnd();
        response.Close();
        readStream.Close();
        return sResponse;
    }
    catch
    {
        return "";
    }
}


protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("register.aspx");
    }
}