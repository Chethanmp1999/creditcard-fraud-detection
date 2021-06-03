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
        if (DropDownList1.SelectedValue.Equals("--Select--"))
        {
            TextBox4.ReadOnly = true;
            TextBox5.ReadOnly = true;
        }
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

    protected void TextBox5_TextChanged(object sender, EventArgs e)
    {
        if(TextBox4.Text.Equals(TextBox5.Text))
        {
            TextBox4_TextChanged(sender, e);
        }
        else
        {
            Response.Write("<script>alert('Card Number don't match.');</script>");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        {
            // Step 1 - Identify db path
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Constr"]);

            // Step 2 - Open connection
            con.Open();

            // Step 3 - Build Query
            Random r = new Random();
            String appnum = "Id" + r.Next(1234, 99999).ToString();
            string query = "Insert into CardData values('" + appnum + "','" + NameTB.Text + "','"+DropDownList1.SelectedValue+"','" + TextBox4.Text + "','" + email.Text + "','" + dt1.Text+ "','" + TextBox2.Text + "','" + TextBox1.Text + "','" + TextBox3.Text + "')";

            // Step 4 - Perform operations
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();


            // Step 5 - Close connection
            con.Close();

           

            Response.Write("<script>alert('Card Saved Successfully');</script>");

            Response.Write("<script>window.location='cardregister.aspx';</script>");

            // Response.Redirect("Registration.aspx");
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!DropDownList1.SelectedValue.Equals("--Select--"))
        {
            TextBox4.ReadOnly = false;
            TextBox5.ReadOnly = false;
        }
    }

    protected void TextBox4_TextChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.Equals("Visa"))
        {
            Regex r = new Regex("^(4)[0-9]{15}$");
            if(!r.IsMatch(TextBox4.Text))
            {
                Response.Write("<script>alert('Wrong Credit Card Number');</script>");
            }
        }
        else if (DropDownList1.SelectedValue.Equals("MasterCard"))
        {
            Regex r = new Regex("^(5)[0-9]{15}$");
            if (!r.IsMatch(TextBox4.Text))
            {
                Response.Write("<script>alert('Wrong Credit Card Number');</script>");
            }
        }
        else
        {
            TextBox4.ReadOnly = true;
            TextBox5.ReadOnly = true;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("cardregister.aspx");
    }
}