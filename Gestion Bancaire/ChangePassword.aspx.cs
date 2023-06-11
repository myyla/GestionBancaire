using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gestion_Bancaire
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (Session["forgotpassword"] != null)
            {
                con = new SqlConnection(Common.GetConnectionString());
                cmd = new SqlCommand(@"Update Account Set Password =@password where Username = @Username ", con);
                cmd.Parameters.AddWithValue("@Password", txtNewPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@username", Session["forgotpassword"]);
                try
                {
                    con.Open();
                    int r = cmd.ExecuteNonQuery();
                    if (r > 0)
                    {
                        Response.Redirect("login.aspx", false);
                    }
                    else
                    {
                        error.InnerText = "Invalid input";
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert(' Error - " + ex.Message + " ');</script>");
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx");
        }
    }
}