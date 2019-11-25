using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bank2019Jewett.Pages
{

    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signUpBtn_Click(object sender, EventArgs e)
        {
            signUpDataSource.Insert();
        }

        protected void signUpDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void userNameTextBox_TextChanged(object sender, EventArgs e)
        {

        }
    }
}