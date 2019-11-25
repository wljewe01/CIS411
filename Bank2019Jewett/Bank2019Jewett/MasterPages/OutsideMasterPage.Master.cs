using System;
using System.Web.UI.WebControls;

namespace Bank2019Jewett.MasterPages
{
    public partial class OutsideMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["UserID"] = null;
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void btnLogin2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }
    }
}