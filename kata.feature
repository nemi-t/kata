Feature: Repayment status 
	

Scenario: Repayment status for future loans
Given The loan is created
And The repayment amount is added 
When The loan s start date is in the future  
Then repayment status should be equal to "Not started"
And repayment status should be displayed in grey


Scenario: Repayment status for current loans 
Given The loan is created
And The repayment amount is added
When The loan s start date is previous to the current date 
And The current date is previous to the loan s end date
Then repayment status should be equal to "repaid amount" / ("loan amount"*(1+"margin"))
And repayment status should be displayed in blue

Scenario: Repayment status for expired loans totally repaid
Given The loan is created 
And The repayment amount is added
When The loan s end date is previous to the current date 
And repayment status value is equal to 100% 
Then repayment status should be equal to "repaid amount" / ("loan amount"*(1+"margin"))
And repayment status should be displayed in blue



Scenario: Repayment status for expired loans partially repaid
Given The loan is created 
And The repayment amount is added
When The loan s end date is previous to the current date 
And repayment status value is not equal to 100% 
Then repayment status should be equal to "repaid amount" / ("loan amount"*(1+"margin"))
And repayment status should be displayed in red








