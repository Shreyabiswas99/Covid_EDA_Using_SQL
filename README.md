This project leverages SQL to explore and analyze COVID-19 datasets, focusing on infection rates, death counts, and vaccination statistics. It includes queries designed to calculate death percentages, infection rates, and vaccination coverage, offering insights into the countries and continents with the most significant metrics.

## Key Features:
### Total Cases vs. Total Deaths: Analyze death percentages in relation to total cases for specific regions.
### Total Cases vs. Population: Evaluate the infection rate as a percentage of the population in various locations.
### Top Countries by Infection Rates: Identify the countries with the highest infection rates relative to their population size.
### Top Countries by Death Counts: Determine which countries have recorded the highest total deaths.
### Continents by Death Counts: Aggregate death data by continent to identify which has the highest overall death toll.
### Overall Death Percentage: Calculate the death percentage across the entire dataset.
### Vaccination Progress: Track the cumulative number of vaccinations administered in each region.
### Vaccination Coverage: Determine the percentage of the population vaccinated to date.
## Setup Instructions:
### Prerequisites: Make sure to have SQL environment to run these queries.
### Database Setup: Import the COVID-19 datasets (coviddeaths and covidvaccinations) into your database. (Note : I have already cleaned some of the data and converted blank spaces with null or 0s before convering them to a CSV file)
## Usage:
### Filter Data: Start by using the initial queries to filter and view raw COVID-19 data.
### Metric Analysis: Utilize follow-up queries to calculate important metrics such as death percentages, infection rates, and vaccination coverage.
### Aggregate Insights: Leverage common table expressions (CTEs) and views to aggregate, rank, and gain deeper insights from the data.
## Dashboard 
Based on the data analysis above we have created a dashboard in tableau for better understanding and visualization. 
https://public.tableau.com/app/profile/shreya.biswas2117/viz/CovidDashboard_17247409026550/Dashboard1
(Click to see my dashboard)
## Contributing:
Contributions are welcome! You can enhance the SQL queries or propose new analyses. Feel free to submit pull requests or open issues for discussion.
