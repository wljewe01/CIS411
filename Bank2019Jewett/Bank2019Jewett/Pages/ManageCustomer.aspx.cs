using System;
using System.Web.UI.WebControls;

namespace Bank2019Jewett.Pages
{
    public partial class ManageCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dbCustomerUpdate_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            dsCustomerList.DataBind();
            grvCustomer.DataBind();
        }

        protected void dbCustomerUpdate_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            dsCustomerList.DataBind();
            grvCustomer.DataBind();
        }

        protected void dbCustomerUpdate_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            dsCustomerList.DataBind();
            grvCustomer.DataBind();
        }
    }
}