using System;

namespace loan2019
{
    public class PaymentCalculator
    {

        public AmortizationLine[] Schedule
        {

            get
            {
                return new AmortizationSchedule((Principal), MonthlyPayment, Months, MonthlyInterestRate).Schedule;
            }

        }


        private double mydecPrincipal = 100000; // this is our principal. The public property is manipulating the private variable.

        public double Principal // this is to define the pricinpal. 
        {
            get
            {

                return mydecPrincipal;
            }

            set
            {

                if (value > 0)
                {
                    mydecPrincipal = value;
                }

            }


        }


        private double mydecInterestRate = 0.06;

        public double InterestRate// this is to define the Interest Rate
        {
            get { return mydecInterestRate; }
            set { if (value > 0) mydecInterestRate = value; }
        }


        private int myintMonths = 120;

        public int Months // This is to define the term 
        {
            get { return myintMonths; }
            set { if (value > 0) myintMonths = value; }
        }

        public double MonthlyInterestRate
        {
            get { return (double)mydecInterestRate / 12; }

        }

        public double MonthlyPayment
        {
            get
            {

                double decBottomofFormula = Math.Pow((double)(1 + MonthlyInterestRate), (double)Months) - 1;

                return (MonthlyInterestRate + (MonthlyInterestRate / decBottomofFormula)) * mydecPrincipal;

            }

        }


    }


    public class AmortizationLine

    {
        public AmortizationLine(double Principal, double InterestRate, double Payment)

        {
            myInterestPaid = Principal * InterestRate;//
            myBeginningBalance = Principal;
            myPrincipalPaid = Payment - myInterestPaid;
            myEndingBalance = Principal - myPrincipalPaid;

        }

        private double myEndingBalance = 0; // this is to define endlingbalance
        public double EndingBalance
        {
            get { return myEndingBalance; }
        }

        private double myBeginningBalance = 0; // this is to define beginningbalance
        public double BeginningBalance
        {
            get { return myBeginningBalance; }
        }

        private double myInterestPaid = 0;
        public double InterestPaid
        {
            get { return myInterestPaid; }
        }

        private double myPrincipalPaid = 0;
        public double PrincipalPaid
        {
            get { return myPrincipalPaid; }
        }

    }


    public class AmortizationSchedule

    {
        AmortizationLine[] mySchedule;
        public AmortizationSchedule(double Principal, double MonthlyPayment, int NumberOfMonths, double MonthlyInterestRate)
        {
            mySchedule = new AmortizationLine[NumberOfMonths + 1];
            mySchedule[0] = new AmortizationLine(Principal, 0, 0);
            for (int intMonth = 1; intMonth <= NumberOfMonths; intMonth++)
            {
                mySchedule[intMonth] = new AmortizationLine(mySchedule[intMonth - 1].EndingBalance, MonthlyInterestRate, MonthlyPayment);

            }

        }

        public AmortizationLine[] Schedule
        { get { return mySchedule; } }

    }


}