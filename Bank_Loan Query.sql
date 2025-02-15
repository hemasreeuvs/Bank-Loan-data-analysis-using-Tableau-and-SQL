

--Retrieve the Data
select * from 
Bank_Loan

Select Getdate()

--Find the total number of Applications 
select count(id) Total_no_ofapplications
from bank_loan

--MTD Loan Applications
select count(id) Total_no_ofapplications
from bank_loan
Where Month(issue_date) = 12 And year(issue_date) = 2021

--PMTD Loan Applications
select count(id) Previous_Month_Total_no_ofapplications
from bank_loan
Where Month(issue_date) = 11 And year(issue_date) = 2021

--Total Funded amount
Select sum(loan_amount) Total_Loan_amount
from bank_loan

--Checking month of issue date
Select sum(loan_amount) Total_Loan_amount
from bank_loan
Where Month(issue_date) = 12 AND Year(issue_date) = 2021

--For Previous Month

Select sum(loan_amount) Previous_Total_Loan_amount
from bank_loan
Where Month(issue_date) = 11 AND Year(issue_date) = 2021

---Total Amount Received
select sum(total_payment) total_amount_received
from bank_loan

--Monthly
select sum(total_payment) total_amount_received
from bank_loan
Where Month(issue_date) = 12 AND Year(issue_date) = 2021

--Previous Month

select sum(total_payment) Previous_total_amount_received
from bank_loan
Where Month(issue_date) = 11 AND Year(issue_date) = 2021

--Average interest 
select avg(int_rate)*100 Average_Interest_Rate from Bank_loan

---Convert to rounded format

select Round(avg(int_rate)*100,2) Average_Interest_Rate from Bank_loan

--For Current Month

select Round(avg(int_rate)*100,2) Average_Interest_Rate from Bank_loan
Where Month(issue_date) = 12 AND Year(issue_date) = 2021

---Previous Month
select Round(avg(int_rate)*100,2) Average_Interest_Rate from Bank_loan
Where Month(issue_date) = 11 AND Year(issue_date) = 2021

--Average DTL 
select Round(avg(dti)*100,2) Average_DTI_Rate from Bank_loan

select Round(avg(dti)*100,2) Average_DTI_Rate from Bank_loan
Where Month(issue_date) = 12 AND Year(issue_date) = 2021

select Round(avg(dti)*100,2) Average_DTI_Rate from Bank_loan
Where Month(issue_date) = 11 AND Year(issue_date) = 2021


Select loan_status
from bank_loan
Group by loan_status

--We are trying find the Good loan and bad loan 

Select 
   (count(case when loan_status='Fully Paid' OR loan_status = 'Current' Then id END) *100
   /
   Count(id) ) As Good_loan_percentage
from bank_loan



Select count(id) as good_loan_applications from bank_loan
where loan_status ='Fully Paid' OR loan_status = 'Current'

Select sum(loan_amount)as good_loan_funded_amount 
from bank_loan
where loan_status ='Fully Paid' OR loan_status = 'Current'

Select 
   (count(case when loan_status='Charged Off' Then id END) *100
   /
   Count(id) ) As Bad_loan_percentage
from bank_loan


Select count(id) as bad_loan_applications from bank_loan
where loan_status ='Charged Off'

Select sum(loan_amount)as bad_loan_funded_amount 
from bank_loan
where loan_status = 'Charged Off' 



Select loan_status,
Count(id) as LoanCount,
sum(total_payment) as total_amount_received,
sum(loan_amount) as total_funded_amount,
Round(Avg(int_rate),2)*100 as interest_rate,
Round(avg(dti),2)*100 as DTI
from bank_loan
Group by loan_status


select * from 
Bank_Loan


 Select
 Month (issue_date) as month_name,
 Datename(Month, issue_date) As Month_Name,
 count(id) as Total_LOan_applications,
sum(total_payment) as total_amount_received,
sum(loan_amount) as total_funded_amount
from bank_loan
Group by Month (issue_date),Datename(Month, issue_date)  
Order by Month (issue_date)

Select
 address_state,
 count(id) as Total_Loan_applications,
sum(total_payment) as total_amount_received,
sum(loan_amount) as total_funded_amount
from bank_loan
Group by address_state
Order by SUM(loan_amount) DESC

Select
 term,
 count(id) as Total_Loan_applications,
sum(total_payment) as total_amount_received,
sum(loan_amount) as total_funded_amount
from bank_loan
Group by term
Order by term


Select
 emp_length,
 count(id) as Total_Loan_applications,
sum(total_payment) as total_amount_received,
sum(loan_amount) as total_funded_amount
from bank_loan
Group by emp_length
Order by count(id) DESC

Select
 purpose,
 count(id) as Total_Loan_applications,
sum(total_payment) as total_amount_received,
sum(loan_amount) as total_funded_amount
from bank_loan
Group by  purpose
Order by count(id) DESC

Select
 home_ownership,
 count(id) as Total_Loan_applications,
sum(total_payment) as total_amount_received,
sum(loan_amount) as total_funded_amount
from bank_loan
Group by home_ownership
Order by count(id) DESC

