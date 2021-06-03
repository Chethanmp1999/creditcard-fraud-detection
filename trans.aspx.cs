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
        // Session["Username"] = "aaa";
        // Session["Email"] = "xyz";
        r1.Visible = false;
        r2.Visible = false;
        r3.Visible = false;
        r4.Visible = false;
        date.Value = DateTime.Today.ToShortDateString();
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        DateTime d1 = DateTime.Now;
        //DateTime d2 = Calendar1.SelectedDate;
      //  TimeSpan difference = d1.Subtract(d2);
       // double age=(difference.TotalDays / 365.25);
      //  TextBox2.Text = Math.Round(age, 1).ToString();
    }
    

    protected void Button2_Click(object sender, EventArgs e)
    {
        {
            // Step 1 - Identify db path
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Constr"]);

            // Step 2 - Open connection
            con.Open();
            string query = "select Count(*) from CardData where Cnum='"+ccard.Text+"' and Cnum in (select Cardnum from NewCard where Bname='"+sel.Value+"')";
            SqlCommand cmd = new SqlCommand(query, con);
            int count = 0;
            try
            {
                count = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch
            {
                count = 0;
            }
            if(count==0)
            {
                Response.Write("<script>alert('Card not found');</script>");
                Response.Write("<script>window.location='trans.aspx';</script>");

            }
            else
            {
                string ip = "";
                string strHostName = "";
                strHostName = System.Net.Dns.GetHostName();

                IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(strHostName);
                
                IPAddress[] addr = ipEntry.AddressList;
                for(int i=0;i<ipEntry.AddressList.Count();i++)
                {
                    if(ipEntry.AddressList[i].ToString().StartsWith("192"))
                    {
                        ip = ipEntry.AddressList[i].ToString();
                        break;
                    }
                }

                query = "select Count(*) from Transactions where Cname='" + ccard.Text + "'";
                cmd = new SqlCommand(query, con);
                int tcount = 0;
                double avgamt = 0;
                try
                {
                    tcount = Convert.ToInt32(cmd.ExecuteScalar());
                   
                }
                catch
                {
                    count = 0;
                }


                if(tcount>0)
                {
                    query = "select avg(Convert(float,Amount)) from Transactions where Cname='" + ccard.Text + "' and Stat='Processed'";
                    cmd = new SqlCommand(query, con);
                    avgamt = Convert.ToDouble(cmd.ExecuteScalar());
                }

                avgamt = avgamt * 5;
                String status = "Processed";
                if(Convert.ToDouble(amount.Value)>avgamt)
                {
                    status = "Fraud";
                }
                Random r = new Random();
                String appnum = "Tran" + r.Next(1234, 99999).ToString();
                query = "insert into Transactions values ('"+appnum+"','"+sel.Value+"','"+slt.SelectedValue+"','"+ ccard.Text + "','" + TextBox1.Text + "','" + amount.Value + "','" + date.Value + "','" + ip + "','"+status+ "','"+ Session["Username"].ToString()+ "','"+accnum.Text+"','"+mnum.Text+"' )";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                if(status == "Fraud" )
                {
                    try
                    {
                        MailMessage m = new MailMessage("mpchethan456@gmail.com", Session["Email"].ToString(), "Fraud Transaction alert", "Transaction "+appnum+" is blocked due to fraud detection. For more details visit to the application");

                        SmtpClient s = new SmtpClient("smtp.gmail.com", 587);
                        s.Credentials = new System.Net.NetworkCredential("mpchethan456@gmail.com", "Qwerty@123");
                        s.EnableSsl = true;
                        s.Send(m);
                    }
                    catch (Exception) 
                    {

                    }
                }
            }





            con.Close();

           

            Response.Write("<script>alert('Transaction is under processing. Please wait for approval');</script>");

            Response.Write("<script>window.location='trans.aspx';</script>");

            // Response.Redirect("Registration.aspx");
        }
    }
    

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("trans.aspx");
    }

    protected void slt_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(slt.SelectedValue.Equals("Recharge"))
        {
            r1.Visible = true;
            r2.Visible = true;
            r3.Visible = false;
            r4.Visible = false;
        }
        else if (slt.SelectedValue.Equals("Account Transfer"))
        {
            r1.Visible = false;
            r2.Visible = false;
            r3.Visible = true;
            r4.Visible = true;
        }
        else
        {

            r1.Visible = false;
            r2.Visible = false;
            r3.Visible = false;
            r4.Visible = false;
        }
    }
}