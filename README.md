# Piotr Dąbrowski – Data Analyst Portfolio

---

## About

Hi, I'm Piotr! I'm currently completing my master's degree in **Data Analytics and Social Research** at the **Jagiellonian University** in Kraków.  
I’m passionate about data visualization, database management, and using data to understand social patterns and trends.

I have practical experience in HR analytics, international logistics, and database maintenance.  
I enjoy working with tools like **Power BI**, **Excel**, and **SQL**, and I’m constantly looking for ways to grow as a data professional.
  
You can also connect with me on [LinkedIn](https://www.linkedin.com/in/piotr-dąbrowski21/)

---

## Education

- 🎓 **Master's in Data Analytics and Social Research**, Jagiellonian University, Kraków (2023 – 2025)  
- 🎓 **Bachelor's in Sociology**, Jagiellonian University, Kraków (2020 – 2023)

---

## Professional Experience

- **People Analytics Intern** – *Philip Morris International* (2024 – 2025)  
  Supporting HR data analysis, reporting, automation, and trend identification using tools like **Qualtrics**, **Power BI**, and **Excel**.

- **International Logistics Intern** – *ABB* (2023)  
  Coordinated multimodal transport, managed transportation databases, and optimized transport services using a **TMS system**.

- **Data Intern** – *CYBERlabs – Systemy Informatyczne* (2022)  
  Managed customer databases, analyzed sales, created presentations, and used **Google Analytics** and **Meta tools**.

---

## Table of Contents

- 📁 Projects  
- 🛠️ Skills  
- 📄 Resume  

- ---

## 📁 Projects

### [MoviesDB – SQL Database Project](https://github.com/Mkrela11/Workspace/blob/main/MoviesDB)

A comprehensive SQL database project built entirely from scratch, focusing on:

- Designing normalized tables with constraints and foreign key relations  
- Populating data from real-world Oscar-winning films and actors  
- Implementing analytical SQL queries and custom views  
- Performing data cleaning and validation using `ALTER`, `MERGE`, `CHECK`, and `PIVOT`  
- Incorporating sentiment analysis of reviews via keyword classification  

This project demonstrates both technical SQL skills and a thoughtful approach to relational database design and storytelling through data.

### [Job Listing Dashboard – Power BI Application Portal (Simulation)](https://github.com/Mkrela11/Workspace/blob/main/Job%20Application%20Dashboard.pbix)

An interactive Power BI dashboard simulating a **job application portal**, built to showcase user experience design and analytical capabilities. The dashboard allows users to:

-  Browse job offers filtered by **location**, **department**, and **work model** (remote / hybrid / on-site)  
-  Explore visual summaries of job openings across Europe via **map and bar charts**  
-  Navigate to detailed job listings including **title**, **requirements**, **benefits**, and **descriptions**  
-  Use a fully simulated **application form** with fields for personal data and position selection  
-  Submit an application and receive visual confirmation in an intuitive UX flow

This project demonstrates practical skills in **Power BI interface design**, **data modeling**, and **user journey planning** in a business-like recruitment scenario.

### [Olist E-Commerce SQL Analysis](https://github.com/Mkrela11/Workspace/blob/main/Olist%20SQL%20Analsyis.sql)

An in-depth SQL analytics project based on the real-world **Brazilian e-commerce Olist dataset**, designed to showcase relational reasoning, data segmentation, and business insights extraction.

The project is structured into five thematic analytical segments:

- **Segment 1: Core KPIs** – summary statistics on customers, sellers, orders, products, and reviews  
- **Segment 2: Orders & Payments** – revenue calculations, shipping costs, and payment methods including installments  
- **Segment 3: Customer Segmentation** – classification into VIP / Medium / Low spenders, with regional behavior insights  
- **Segment 4: Top Sellers & Products** – most valuable products and sellers ranked by revenue, reach, and customer base  
- **Segment 5: Delivery Problems** – late deliveries, average delays, and their correlation with customer review scores

This project demonstrates advanced SQL querying, use of window functions, temporary tables, segmentation logic, and preparation of outputs for BI tools such as Power BI or Tableau.

### [Olist Power BI Dashboard](https://github.com/Mkrela11/Workspace/blob/main/Olist%20Dashboard.pdf)

A comprehensive **Power BI report** built on top of the Olist Brazilian e-commerce dataset, designed to visually present business performance, customer behavior, and sales operations.

Due to the DB size it's only PDF. If you would like to view an PBIX - contact me. 

This dashboard was structured across multiple views and includes:

-  **Executive Overview** – a clean one-page layout showcasing KPIs like revenue, delayed orders, average order value, and item count  
-  **Product & Seller Insights** – top categories and sellers by value, along with detailed sales breakdowns  
-  **Payment Breakdown** – income grouped by payment types with proportions and volumes  
-  **Customer Segmentation** – revenue band classification based on purchase value and grouped order volume  

This project demonstrates advanced **Power BI interface design**, **data modeling**, **DAX usage**, and **data storytelling** using real-world e-commerce data.

### [HR Analytics Dashboard – IBM Employees](https://github.com/Mkrela11/Workspace/blob/main/Hr_IBM.pbix)

This project was designed to explore HR metrics related to employee demographics, departmental breakdown, and education, supporting workforce planning and strategic HR insights.

Database used for the project is here: https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset?resource=download

The dashboard provides:

-  **Educational Analysis** – visualizations of employee education levels and fields of study  
-  **Department Breakdown** – headcount distribution across business units (e.g., R&D, Sales, HR)  
-  **Demographic KPIs** – average employee age and gender split  
-  **Distance to Work Insights** – pie chart displaying commuting distance categories  
-  **HR Table View** – structured tabular breakdown of employees by department

This project demonstrates practical skills in **Power BI layout**, **color coordination**, **interactive filtering**, and **data-driven HR reporting** in a corporate context.

### [HR IBM Data Analsyis in R](https://github.com/Mkrela11/Workspace/blob/main/Hr_IBM_R)

It's a follow up to the projected mentioned above.

Here I have focused more on variables messured within interval scales. I've used libraries like RandomForest, psych, pheatmap, factoextra, dplyr, ggplot2 and tidyr. 
Main idea behind this code was to take a deeper look into HR Data and analyze trends, outliers and use statistical methods to analyze results.

Code Provides:

- **Attrition Modeling (Random Forest)** – prediction of employee churn based on variables like overtime, job satisfaction, or years at company  
- **Principal Component Analysis** – dimensionality reduction and rotation (Varimax), capturing 75% of variance in 4 PCs  
- **Clustering** – segmentation of employees into distinct behavioral profiles, visualized with cluster plots  
- **Job Satisfaction Regression** – ordinal regression assessing influence of distance, overtime, and promotion history on satisfaction  
- **Income Outlier Detection** – IQR-based detection of salary anomalies with boxplots, focus on top 5% earners  
- **Role Profiling for High Earners** – breakdown of top-paid employees by department, job role, and attrition rate

### [Market Mindz Dashboard](https://github.com/Mkrela11/Workspace/blob/main/Market%20Mindz%20Dashboard.pbix)

Project created on a simulated database filled with customer related data.
This project is meant to demonstrate various skills starting with data manipulation with power query to create a sub tables thru creatin nice and informative visuals and finishing the project with use of new AI widgets in PowerBI.

Dashboard Provides:

-- **Capaign performance page** This page include various tools to take a deep dive into buyers data. 
-- **Buyer Composition** Here we can find an answer to questions trying to define who our buyers is and which cmpaigns were really sucessful in terms of selling certain products. 
-- **Purchase Drivers** What motivates our buyers? Insights based on AI tools helpfull in predicting and analyzing the dataset

## 🛠️ Skills 

**IBM SPSS**  
Organizing data, analyzing variables, creating frequency tables, and generating descriptive statistics for social science applications.

**MS Office**  
Proficient in Microsoft Excel, Word, and PowerPoint, with experience in both data processing and presentation formatting.

**Power BI**  
Experience in data visualization, importing, merging, cleaning, and transforming datasets. Skilled in modeling and publishing reports using the Power BI desktop application.

**MAXQDA**  
Competent in qualitative data analysis: variable coding, generating code maps, and using the platform for social research.

**SQL**  
Fundamental knowledge of SQL for data filtering, sorting, summarizing, and dataset manipulation. Able to create and edit queries for business use cases.

**English**  
Fluent in English. Experience working in English-only teams and with international clients.

## 📄 Resume  

###  My CV (https://github.com/Mkrela11/Workspace/blob/main/Piotr_Dabrowski.pdf)


