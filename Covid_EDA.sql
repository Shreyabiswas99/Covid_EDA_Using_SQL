USE Portfolio;

SELECT *
FROM coviddeaths
WHERE continent IS NOT NULL
ORDER BY 3,4;

SELECT location, `date`, total_cases, total_deaths, new_cases, population
FROM coviddeaths
WHERE continent IS NOT NULL
ORDER BY 1, 2;

-- Total cases VS Total deaths --

SELECT location, `date`, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM coviddeaths
WHERE location LIKE '%states%'
ORDER BY 1, 2;

-- Total cases VS Population --

SELECT location, `date`, total_cases, population, (total_cases/population)*100 as PercentagePopulationInfected
FROM coviddeaths
WHERE location LIKE '%states%'
ORDER BY 1, 2;

-- Highest Infection rate VS Population --

SELECT location, population, MAX(total_cases) AS HighestPopulationInfected, MAX((total_cases/population))*100 as PercentagePopulationInfected
FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY 1, 2
ORDER BY PercentagePopulationInfected DESC;

-- Highest death count VS Population --

SELECT location, MAX(total_deaths) as TotalDeathCount
FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY 1
ORDER BY TotalDeathCount DESC;

-- Highest death count VS Population by continent --

SELECT continent, MAX(total_deaths) as TotalDeathCount
FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY 1
ORDER BY TotalDeathCount DESC;

-- Global Numbers --

SELECT `date`, SUM(new_cases), SUM(new_deaths), SUM(new_deaths)/SUM(new_cases)*100 AS DeathPercentage
FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY 1
ORDER BY 2,3;

SELECT SUM(new_cases), SUM(new_deaths), SUM(new_deaths)/SUM(new_cases)*100 AS DeathPercentage
FROM coviddeaths
WHERE continent IS NOT NULL;

-- Covid Vaccinations --

SELECT *
FROM covidvaccinations
WHERE continent IS NOT NULL;

-- Rolling count of People vaccinated --

SELECT d.continent, d.location, d.date, d.population, v.new_vaccinations,
SUM(v.new_vaccinations) OVER (PARTITION BY d.location ORDER BY d.location, d.date) AS TotalVaccinated
FROM coviddeaths d
JOIN covidvaccinations v
     ON d.location = v.location
     AND d.date = v.date
WHERE d.continent IS NOT NULL
ORDER BY 2, 3;

-- Population VS Vaccination --

WITH popvac (continent, location, `date`, population, new_vaccinations, TotalVaccinated) AS (
SELECT d.continent, d.location, d.date, d.population, v.new_vaccinations,
SUM(v.new_vaccinations) OVER (PARTITION BY d.location ORDER BY d.location, d.date) AS TotalVaccinated
FROM coviddeaths d
JOIN covidvaccinations v
     ON d.location = v.location
     AND d.date = v.date
WHERE d.continent IS NOT NULL )
SELECT *, (TotalVaccinated/population)*100 AS PercentageVaccinated
FROM popvac;

-- Creating a view --

CREATE VIEW PopulationVaccinated AS
SELECT d.continent, d.location, d.date, d.population, v.new_vaccinations,
SUM(v.new_vaccinations) OVER (PARTITION BY d.location ORDER BY d.location, d.date) AS TotalVaccinated
FROM coviddeaths d
JOIN covidvaccinations v
     ON d.location = v.location
     AND d.date = v.date
WHERE d.continent IS NOT NULL
ORDER BY 2, 3;

SELECT * 
FROM PopulationVaccinated;

-- Queries for Tableau --

Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
From coviddeaths
where continent is not null 
order by 1,2;

Select location, SUM(new_deaths) as TotalDeathCount
From coviddeaths
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc;

Select location, population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From coviddeaths
Group by location, population
order by PercentPopulationInfected desc;

Select location, population,`date`, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From coviddeaths
Group by location, population, `date`
order by PercentPopulationInfected desc;


