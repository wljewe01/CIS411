using System;
using System.Web.UI.WebControls;

namespace Bank2019Jewett
{
    public partial class ManageLoans : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dsCurrentLoan_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            customerDDList.DataBind();
            gvLoansList.DataBind();
        }

        protected void dsCurrentLoan_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            customerDDList.DataBind();
            gvLoansList.DataBind();
        }

        protected void dsCurrentLoan_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            customerDDList.DataBind();
            gvLoansList.DataBind();
        }

        protected void dsCurrentLoan_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            customerDDList.DataBind();
            gvLoansList.DataBind();
        }

        protected void gvLoansList_SelectedIndexChanged(object sender, EventArgs e)
        {
            double decPrin = double.Parse(gvLoansList.SelectedRow.Cells[2].Text.ToString());
            double decInterest = double.Parse(gvLoansList.SelectedRow.Cells[3].Text.ToString());
            int intMonth = int.Parse(gvLoansList.SelectedRow.Cells[4].Text.ToString());

            loan2019.PaymentCalculator loanPayment = new loan2019.PaymentCalculator();
            loanPayment.Principal = decPrin;
            loanPayment.InterestRate = decInterest;
            loanPayment.Months = intMonth;

            lblPayment.Text = loanPayment.MonthlyPayment.ToString("C");

            grvSchedule.DataSource = loanPayment.Schedule;
            grvSchedule.DataBind();
        }

        protected void frvCustomerUpdate_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }
    }
}