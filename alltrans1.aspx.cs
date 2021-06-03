using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
        BindData();
    }

    public void BindData()
    {
        con.Open();
        //string uname = Session["UserName"].ToString();
        string query = "SELECT * FROM Transactions where Uname='"+Session["Username"].ToString()+"'";
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
                string query = "Update Transactions set Stat='Rejected' where Tranid='" + row.Cells[0].Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();

            }
            catch
            {
            }
            finally
            {
                con.Close();
                Response.Redirect("alltrans1.aspx");
            }
        }
        if (e.CommandName == "Approve")
        {
            int x = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[x];
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["Constr"]);
            try
            {
                con.Open();
                string query = "Update Transactions set Stat='Processed' where Tranid='" + row.Cells[0].Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();

            }
            catch
            {
            }
            finally
            {
                con.Close();
                Response.Redirect("alltrans1.aspx");
            }
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