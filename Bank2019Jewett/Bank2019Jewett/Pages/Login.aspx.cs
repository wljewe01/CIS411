using System;
using System.Data;
using System.Web.UI;


namespace Bank2019Jewett.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {

            try
            {
                DataView dview = (DataView)dbLogin.Select(DataSourceSelectArguments.Empty);

                foreach (DataRow dRow in dview.Table.Rows)
                {
                    if (txtPassword.Text == dRow["vcPassword"].ToString())
                    {
                        Session["UserID"] = dRow["UserID"];
                        Response.Redirect("Secure.aspx");
                    }
                }
            }


            
            catch(Exception)
            {
                txtPassword.Focus();
            }
            
        }
    }
}