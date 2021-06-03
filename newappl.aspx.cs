using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Constr"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
    }

    public void BindData()
    {
        con.Open();
        //string uname = Session["UserName"].ToString();
        string query = "SELECT Appno,Dated,Apby,Bname,Climit,Aadhar,Phone,Cardnum,Email FROM NewCard where Stat='Pending'";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        con.Close();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Reject")
        {
            int x = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[x];
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Constr"]);
            try
            {
                con.Open();
                string query = "Delete from NewCard where Appno='" + row.Cells[0].Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();

            }
            catch
            {
            }
            finally
            {
                con.Close();
                Response.Redirect("newappl.aspx");
            }
        }

        if (e.CommandName == "Accept")
        {
            int x = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[x];
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Constr"]);
            try
            {
                con.Open();
                string query = "Update NewCard set Stat='Approved' where Appno='" + row.Cells[0].Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();


                String cvv = string.Empty;
                query = "Select Cvv from NewCard where Appno='" + row.Cells[0].Text + "'";
                cmd = new SqlCommand(query, con);
                cvv=Convert.ToString(cmd.ExecuteScalar());

                try
                {
                    MailMessage m = new MailMessage("mpchethan456@gmail.com", row.Cells[7].Text, "Card has been activated", "Your Card# is " + row.Cells[8].Text + " and CVV is " + cvv);

                    SmtpClient s = new SmtpClient("smtp.gmail.com", 587);
                    s.Credentials = new System.Net.NetworkCredential("mpchethan456@gmail.com", "Qwerty@123");
                    s.EnableSsl = true;
                    s.Send(m);
                }
                catch (Exception ex)
                {

                }

                try
                {
                    string sUserID = "SunnyBoyka";
                    string sPwd = "564715";
                    string sNumber = "91" + row.Cells[6].Text;
                    string sSID = "SMSSEN";
                    string sMessage = "Your Card is  " + row.Cells[8].Text + " and CVV is " + cvv;
                   
                    string sURL = "http://smslane.com/vendorsms/pushsms.aspx?user=" + sUserID + "&password=" + sPwd + "&msisdn=" + sNumber + "&sid=" + sSID + "&msg=" + sMessage + "&mt=0&fl=0";
                http://smslane.com/vendorsms/pushsms.aspx?user=SunnyBoyka&password=564715&msisdn=919148547460&sid=WEBSMS&msg=Test&mt=0&fl=0

                    string sResponse = GetResponse(sURL);
                    //return sResponse;
                    //"Card has been activated", "Your Card# is " + row.Cells[8].Text + " and CVV is " + cvv


                    //string sUserID = "SunnyBoyka";
                    //string sPwd = "564715";
                    //string sNumber = "91" + row.Cells[7].Text;
                    //string sSID = "WEBSMS";
                    //string sMessage = "Your Card# is " + row.Cells[8].Text + " and CVV is " + cvv;
                    //string sURL = "http://smslane.com/vendorsms/pushsms.aspx?user=" + sUserID + "&password=" + sPwd + "&msisdn=" + sNumber + "&sid=" + sSID + "&msg=" + sMessage + "&mt=0&fl=0";
                    ////http://smslane.com/vendorsms/pushsms.aspx?user=SunnyBoyka&password=564715&msisdn=919148547460&sid=WEBSMS&msg=Test&mt=0&fl=0
                    ////
                    //string sResponse = GetResponse(sURL);
                }
                catch(Exception ex)
                {

                }

            }
            catch(Exception ex)
            {
            }
            finally
            {
                con.Close();
                Response.Redirect("newappl.aspx");
            }
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

    protected void RowDelete(Object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception == null)
        {
            GridView1.EmptyDataText = "Row deleted successfully.";
        }

    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }


    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       
    }
}