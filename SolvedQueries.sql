SELECT * FROM mortgage_loans;

## Easy Queries
-- 1. Total Number of Loans in the Database
SELECT COUNT(*) AS Total_Loans FROM mortgage_loans;


-- 2. Loan Count by State
SELECT state, COUNT(*) AS total_loan_count
FROM mortgage_loans
GROUP BY state
ORDER BY total_loan_count DESC;


-- 3. Loan Approval Rate
SELECT 
    SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) * 100 / COUNT(*) AS approval_rate
FROM mortgage_loans;


-- 4. Total Loan Amount by Loan Status (Approved vs. Rejected)
SELECT loan_status, FORMAT(SUM(loan_amount), 0) AS total_loan_Amount
FROM mortgage_loans
GROUP BY loan_status;


-- 5.Loan Approval Rate by State
SELECT state, COUNT(*) AS Approved_loan,
ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM mortgage_loans), 2) AS Approval_Rate
FROM mortgage_loans
WHERE loan_status = 'Approved'
GROUP BY state;


-- 6. Loans Approved per Month
SELECT DATE_FORMAT(application_date, '%y-%m') AS month_year, COUNT(*) AS total_count
FROM mortgage_loans
WHERE loan_status = 'Approved'
GROUP BY month_year
ORDER BY month_year;


-- 7.  Loans by Purpose (Home Purchase, Refinance, etc.)
SELECT loan_purpose, COUNT(*) AS loan_count
FROM mortgage_loans
GROUP BY loan_purpose
ORDER BY loan_count DESC;


-- 8. Average Interest Rate by Loan Purpose
SELECT loan_purpose, ROUND(AVG(interest_rate), 2) AS avg_interest_rate
FROM mortgage_loans
GROUP BY loan_purpose;


-- 9.  Loans with Credit Score Above 700 and Approved Status
SELECT borrower_name, loan_amount, credit_score, interest_rate, application_date
FROM mortgage_loans
WHERE credit_score > 700 AND loan_status = 'Approved';


-- 10. Loans in the Last Year
SELECT * FROM mortgage_loans
WHERE application_date > CURRENT_DATE() - INTERVAL 1 YEAR;

## Medium Queries

-- 11. Average Interest Rate Based on Credit Score Ranges
SELECT 
    CASE 	
        WHEN credit_score >= 750 THEN 'Excellent (>=750)'
        WHEN credit_score BETWEEN 700 AND 749 THEN 'Good (700-749)'
        WHEN credit_score BETWEEN 650 AND 699 THEN 'Fair (650-699)'
        ELSE 'Poor (<650)'
    END AS credit_category,
    ROUND(AVG(interest_rate), 2) AS avg_rate,
    COUNT(*) AS num_loans
FROM mortgage_loans
GROUP BY credit_category
ORDER BY avg_rate DESC;


-- 12.Which States Have the Highest Loan Approval Rates?
SELECT state, COUNT(*) AS total_loans,
SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) AS approved_loans,
ROUND(SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS approval_rate
FROM mortgage_loans
GROUP BY state
ORDER BY approval_rate DESC;


-- 13.Monthly Loan Applications Trend
SELECT DATE_FORMAT(application_date, '%y-%m') AS month_year,
COUNT(*) AS total_loans
FROM mortgage_loans
GROUP BY month_year
ORDER BY month_year;


-- 14. Maximum Loan Amount by Credit Score Range
SELECT 
    CASE
        WHEN credit_score >= 750 THEN 'Excellent (>=750)'
        WHEN credit_score BETWEEN 700 AND 749 THEN 'Good (700-749)'
        WHEN credit_score BETWEEN 650 AND 699 THEN 'Fair (650-699)'
        ELSE 'Poor (<650)'
    END AS credit_category, 
    MAX(loan_amount) AS max_loan_amount
FROM mortgage_loans
GROUP BY credit_category;

