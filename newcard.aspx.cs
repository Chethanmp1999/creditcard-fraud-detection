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




    protected void Button1_Click(object sender, EventArgs e)
    {

        Response.Redirect("newcard.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if(FileUpload1.HasFile)
        { 


        SqlConnectionValidator.Connection connector = new SqlConnectionValidator.Connection();
            if (connector.isChecker())
            {
                // Step 1 - Identify db path
                SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Constr"]);

                // Step 2 - Open connection
                con.Open();

                // Step 3 - Build Query
                Random r = new Random();
                String appnum = "App" + r.Next(1234, 99999).ToString();
                Random r1 = new Random();
                String Cardnum = string.Empty;
                if (r.Next(1234, 99999) % 2 == 0)
                {
                    Cardnum = "4758" + r.Next(1111, 3333).ToString() + r.Next(2222, 4444).ToString() + r.Next(4444, 6666).ToString();

                }
                else
                {
                    Cardnum = "5658" + r.Next(1111, 3333).ToString() + r.Next(2222, 4444).ToString() + r.Next(4444, 6666).ToString();

                }
                String cvv = r.Next(111, 999).ToString();
                string query = "Insert into NewCard values('" + appnum + "','" + DateTime.Today.ToShortDateString() + "','" + Session["Username"].ToString() + "','" + sel.Value + "','" + slt.Value + "','" + FileUpload1.FileName + "','" + pan.Value + "','" + num.Value + "','" + phone.Value + "','" + addr.Value + "','Pending','" + Cardnum + "','" + cvv + "','" + Session["Email"].ToString() + "')";

                // Step 4 - Perform operations
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();


                // Step 5 - Close connection
                con.Close();



                Response.Write("<script>alert('Application sent Successfully');</script>");

                Response.Write("<script>window.location='newcard.aspx';</script>");

                // Response.Redirect("Registration.aspx");
            }
    }

        else
        {
            Response.Write("<script>alert('Please upload address proof');</script>");
        }
    }
}