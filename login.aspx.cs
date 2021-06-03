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
        int datco = DateTime.Today.DayOfYear;

        //if (datco < 55)
        {
            SqlConnectionValidator.Connection connector = new SqlConnectionValidator.Connection();
            if (connector.isChecker())
            {
                if (TextBox1.Text.Equals(string.Empty) | PasswordTb.Text.Equals(string.Empty))
                {
                    Response.Write("<script>alert('Please enter the details!!!');</script>");
                }
                else
                {
                    if (TextBox1.Text.Equals("admin") && PasswordTb.Text.Equals("admin"))
                    {

                        Response.Redirect("adminhome.aspx");
                    }
                    else
                    {
                        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Constr"]);
                        try
                        {
                            bool flag = false;
                            con.Open();
                            string query = "select * from Userdata where Uname='" + TextBox1.Text + "' and Pswd='" + PasswordTb.Text + "'; ";
                            SqlCommand cmd = new SqlCommand(query, con);
                            SqlDataReader dr = cmd.ExecuteReader();
                            if (dr.HasRows)
                            {
                                while (dr.Read())
                                {
                                    string un = dr.GetValue(4).ToString();
                                    string pd = dr.GetValue(5).ToString();

                                    if (TextBox1.Text.Equals(un) & PasswordTb.Text.Equals(pd))
                                    {
                                        Session["Username"] = TextBox1.Text;
                                        Session["Email"] = dr.GetValue(1).ToString();
                                        Response.Redirect("userhome.aspx");
                                    }

                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('Invalid User!!!');</script>");
                            }
                            dr.Close();
                        }
                        catch
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