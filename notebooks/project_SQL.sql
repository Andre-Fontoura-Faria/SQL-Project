USE project3
SELECT * 
FROM project3

/*1- Selecting only the data from the programns that are related to Data Analytics*/
SELECT DISTINCT program
FROM project3.project3

/*2- all schools, along with their rankings, in descending order of their ranking and savint to a new table*/
CREATE TABLE DataAnalysis_Courses AS 
SELECT school, overallScore, overall, curriculum, jobSupport, review_body, program
FROM project3.project3
WHERE program IN ('Data Analytics Bootcamp', 'Data Analytics Part-Time', 'Data Analytics Career Track', 'Data Analytics & Business Intelligence Course', 'Data Analyst',
'Data Analytics', 'Data Analyst Bootcamp (Part-Time)','Data Analytics Certificate Course','Data Analytics & Business Intelligence Bootcamp','Data Analytics Flex',
'Data Analytics (Part-Time)', 'Data Analytics Immersive')
ORDER BY overallScore DESC 

SELECT school, program 
FROM DataAnalysis_courses

/*3- the top 5 schools, along with their rankings:*/
SELECT school, overallScore, overall, curriculum, jobSupport, review_body, program
FROM DataAnalysis_courses
ORDER BY overallScore DESC
LIMIT 5


/*4- the top 10 schools with the highest number of positive student feedback:*/
SELECT school, overallScore, overall, curriculum, jobSupport, review_body, program,
COUNT(*) AS total_positive_feedback
FROM DataAnalysis_courses
WHERE review_body LIKE '%excellent%' OR review_body LIKE '%great%'
GROUP BY school
LIMIT 10
/*Cheking for extremely positive feedback*/
USE project3
SELECT school, COUNT(*) AS total_positive_feedback
FROM comments
WHERE review_body LIKE '%excellent%' OR review_body LIKE '%great%' OR review_body LIKE '%amazing%'
GROUP BY school
ORDER BY total_positive_feedback DESC
LIMIT 10;


/*Cheking for extremely negative feedback*/
SELECT school, COUNT(*) AS total_positive_feedback
FROM comments
WHERE review_body LIKE '%worst%' OR review_body LIKE '%bad%' OR review_body LIKE '%disappointing%'
GROUP BY school
ORDER BY total_positive_feedback DESC
LIMIT 10;

SELECT school, number_of_reviews, COUNT(*) AS total_positive_feedback
FROM comments
WHERE review_body LIKE '%excellent%' OR review_body LIKE '%great%' OR review_body LIKE '%amazing%'
GROUP BY school, number_of_reviews
ORDER BY total_positive_feedback DESC






/*Cheking the most frequent words that we got from wordcloud*/
SELECT school, review_body
FROM comments
WHERE review_body LIKE '%blatant lie%' OR review_body LIKE '%costly online%' OR review_body LIKE '%lerning portals%'
GROUP BY school, review_body
ORDER BY school

/*Cheking the most frequent words that we got from wordcloud*/
SELECT school, review_body
FROM comments
WHERE review_body LIKE '%people land jobs%' OR review_body LIKE '%application begun smothly%' OR review_body LIKE '%saw tablou written%'
GROUP BY school, review_body
ORDER BY school


/*Cheking the average*/
use comments_da;
SELECT school, ROUND(AVG(overallScore), 2) AS overallScore, ROUND(AVG(overall), 2) AS general, ROUND(AVG(curriculum), 2) AS curriculum, ROUND(AVG(jobSupport), 2) AS jobSupport, COUNT(review_body) as number_of_reviews
FROM comments_da
GROUP BY school
ORDER BY overallScore DESC;

/*Cheking the Graduating Year*/
SELECT school, AVG(graduatingYear) AS GraduatingYear, ROUND(AVG(overallScore), 2) AS avgOverallScore, COUNT(review_body) as number_of_reviews
FROM comments_da
WHERE graduatingYear = 2022
GROUP BY school
ORDER BY avgOverallScore DESC;
