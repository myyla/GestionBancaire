﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gestion_Bancaire
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void lbForgotPassword_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text == string.Empty)
            {
                error.InnerText = " Invzlid Input ";
                txtUsername.Focus();
            }
            else
            {
                Session["forgotpassword"] = txtUsername.Text.Trim();
                Response.Redirect("ForgotPassword.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(Common.GetConnectionString());
            cmd = new SqlCommand(@"Select * from Account where Username = @Username and Password = @Password", con);
            cmd.Parameters.AddWithValue("@UserName", txtUsername.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                bool isTrue = false;
                while (reader.Read())
                {
                    isTrue = true;
                    Session["userId"] = reader["AccountId"].ToString();
                }
                if (isTrue)
                {
                    Response.Redirect("PerformTransaction.aspx", false);
                }
                else
                {
                    error.InnerText = " Invalid input.";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(' Error - " + ex.Message + " ');</script>");
            }
            finally
            {
                reader.Close();
                con.Close();
            }
        }

    }


}