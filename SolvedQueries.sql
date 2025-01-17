SELECT * FROM mortgage_loans;

-- 1. Total Number of Loans in the Database
Select count(*) as Total_Loans
from mortgage_loans;

-- 2. Loan Count by State
Select state, count(*) as total_loan_count
from mortgage_loans
group by state
order by total_loan_count desc;

-- 3. Loan Approval Rate
select 
sum(case when loan_status = 'Approved' then 1 else 0 end)*100/count(*) as approval_rate
from mortgage_loans;

-- 4. Total Loan Amount by Loan Status (Approved vs. Rejected)
select loan_status, format(sum(loan_amount),0) as total_loan_Amount
from mortgage_loans
group by loan_status;

-- 5.Average Interest Rate Based on Credit Score Ranges
select 
case 	
	when credit_score >= 750 then 'Excellent (>=750)'
    when credit_score between 700 and 749 then 'Good (700-749)'
    when credit_score between 650 and 699 then 'Fair (650-699)'
    else 'Poor (<650)'
    end as credit_category,
round(avg(interest_rate),2) as avg_rate,
count(*) as num_loans
from mortgage_loans
group by credit_category
order by avg_rate desc;

-- 6. What is the approval rate of loans by state?
select state, count(*) as Approved_loan,
round(count(*)*100/(select count(*) from mortgage_loans),2) as Approval_Rate
from mortgage_loans
where loan_status = 'Approved'
group by state;

-- 7.  Which states have the highest loan approval rates?
select state,count(*) as total_loans,
sum(case when loan_status = 'Approved' then 1 else 0 end) as approved_loans,
round(sum(case when loan_status = 'Approved' then 1 else 0 end)*100/count(*),2) as approval_rate
from mortgage_loans
group by state
order by approval_rate desc;

-- 8. Monthly Loan Applications Trend
select date_format(application_date, '%y-%m') as month_year,
count(*) as total_loans
from mortgage_loans
group by month_year
order by month_year;

-- 9. Maximum Loan Amount by Credit Score Range
select 
case
	when credit_score >= 750 then 'Excellent (>=750)'
    when credit_score between 700 and 749 then 'Good (700-749)'
    when credit_score between 650 and 699 then 'Fair (650-699)'
    else 'Poor (<650)'
    end as credit_category, 
max(loan_amount) as max_loan_amount
from mortgage_loans
group by credit_category;

-- 10. Loans Approved per Month
select date_format(application_date,'%y-%m') as month_year, count(*) as total_count
from mortgage_loans
where loan_status = 'Approved'
group by month_year
order by month_year;

-- 11. Loans by Purpose (Home Purchase, Refinance, etc.)
select loan_purpose, count(*) as loan_count
from mortgage_loans
group by loan_purpose
order by loan_count desc;

-- 12.Average Interest Rate by Loan Purpose
select loan_purpose, round(avg(interest_rate),2) as avg_interest_rate
from mortgage_loans
group by loan_purpose;

-- 13.Loans with Credit Score Above 700 and Approved Status
select borrower_name, loan_amount, credit_score, interest_rate, application_date
from mortgage_loans
where credit_score > 700 and loan_status = 'Approved';

-- 14. Loans in the Last Year
select *
from mortgage_loans
where application_date > current_date() - interval 1 year

