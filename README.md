# Capstone\_1



Year Up United Data Analytics Training Academy | Week 4 Capstone



# \# Capstone 1: New Jersey Sales Analysis



### \## Project Overview





This project analyzes EmporiUm’s store sales in New Jersey as part of the Year Up United Week 4 Capstone. Using the `sample\_sales` database, I will write SQL queries in MySQL Workbench to track monthly revenue, compare New Jersey’s revenue with the Northeast regional total, and rank New Jersey stores by revenue. I will also examine monthly transaction counts and average sale amounts by product category.



I will create an Excel PivotChart to show how New Jersey revenue changes over time and use the findings to recommend where to focus sales efforts next quarter.



\*\*Assigned sales territory:\*\* New Jersey store sales  

\*\*Region:\*\* Northeast

## Analysis

I used MySQL to analyze EmporiUm’s in-store sales in New Jersey from
2022 through 2025. The analysis covers total revenue, monthly revenue
trends, New Jersey’s share of Northeast revenue, monthly sales counts
and average sale amounts by product category, and store performance.

## Key Findings

- New Jersey generated **$5,175,405.87** in in-store revenue, accounting
  for **21.35%** of the Northeast region’s **$24,237,526.98**.
- Annual revenue increased from approximately **$879,000 in 2022**
  to **$1.87 million in 2025**. **October 2025** was the highest-revenue
  month at **$250,830.46**.
- **Newark** ranked first among 16 stores with recorded sales, generating
  **$623,163.53**, followed by **Trenton** at **$597,565.68**.
  **Paterson** ranked last at **$67,112.57**.

## Recommendation for Next Quarter

Verify Paterson’s operating status and confirm that its sales records are
complete before spending money on a promotion. Its last recorded sale was
November 30, 2024, while other New Jersey stores recorded sales through
December 2025. Paterson also had a higher average sale amount than Newark
($157.17 versus $140.26), but far fewer recorded sales (427 versus 4,443).
If Paterson is still operating and its records are complete, investigate
what is driving its low sales volume.

Review which stores and product categories contributed to the October 2025
peak to see whether those sales gains can be repeated.

## Project Files

- [Territory SQL analysis](balcha_sales_analysis.sql) — Queries for the
  six territory questions.
- [Monthly revenue PivotChart](balcha_territory_chart.xlsx) — Excel
  workbook showing New Jersey’s monthly in-store revenue.
- [Bonus SQL queries](balcha_bonus_queries.sql) — Additional SQL analysis.

### \## Tools



\- MySQL Server and MySQL Workbench

\- Microsoft Excel

\- Git, Git Bash, and GitHub



### \## Progress --November 4, 2026





\- Created the `Capstone\_1` repository on GitHub and cloned it locally using Git Bash.

\- Saved `balcha\_sales\_analysis.sql`, then committed and pushed my initial work to GitHub.

\- Installed MySQL and ran `sample\_sales\_all (1).sql` in MySQL Workbench to create and populate the `sample\_sales` database.

\- Used `SHOW TABLES` to list the tables in `sample\_sales`. The setup script defines eight tables, including `Store\_Sales` and `Online\_Sales`.

\- Queried `Management` and confirmed that the Northeast region includes Maryland, Massachusetts, Maine, and New Jersey.



### \## Planned Deliverables





\- SQL script for the New Jersey sales analysis

\- Excel PivotChart showing an analysis result

\- 10-minute recorded project walkthrough

\- 5-minute live presentation



### \## Video Walkthrough



https://drive.google.com/file/d/1CncNCwZDWlS2pia7TDdhOnWv_4y7RJ7T/view?usp=sharing





