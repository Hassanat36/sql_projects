CREATE DATABASE MY_PROJECT
-- project questions and Answers

-- 1. A query againt the allergies table that returns all the records.

select * from MY_PROJECT.dbo.allergies

-- 2. Return all records from condition where depscription diabetes or prediabetes

SELECT * FROM [dbo].[conditions]
WHERE [DESCRIPTION] = 'diabetes' OR [DESCRIPTION]= 'prediabetes'

/* 3. return unique description from procedures where reasondescriptionis normal 
pregnancy and description not standard pregnancy test.*/

SELECT DISTINCT[DESCRIPTION],[REASONDESCRIPTION]
FROM [dbo].[procedures]
WHERE [REASONDESCRIPTION] = 'normal pregnancy' AND NOT [DESCRIPTION]  = 'standard pregnancy test'

/* 4. write a query to display patient,description,value and multiple the
value by 2.2 and rename it to [weight in Ibs] from observations table.
where description equals to Body weight.*/

SELECT [PATIENT],[DESCRIPTION],([VALUE]*2.2)
AS 'Weight in Ibs'
FROM [dbo].[Observation_clean_new]
WHERE[DESCRIPTION] ='body Weight'

/* 5. A query againt the observations table. return patient,description,
value. divide the value by 2.5 and rename as Height in Inches
where description is Body Height.*/

SELECT [PATIENT],[DESCRIPTION],([VALUE]/2.5)
AS 'Height in Inches'
FROM [dbo].[observations]
WHERE [DESCRIPTION]='body Height'

/* 6. write a query to select patient,description,reasondescription
from medications table
where reasondescription is not null.*/

SELECT [PATIENT],[DESCRIPTION],[REASONDESCRIPTION]
FROM [dbo].[medications]
WHERE [REASONDESCRIPTION] IS NOT NULL

/* 7. Write a query joining the patients table to the medications table using the patient column. 
Use WHERE in your join condition.. 
Your results should contain the columns patient, marital, race, ethnicity, 
and gender from the patients table and description (renamed as medications),
and reasondescription (renamed as diagnosis) from the medications table.*/

SELECT [dbo].[patients].patient,[dbo].[patients].marital,[dbo].[patients].race,[dbo].[patients].ethnicity,[dbo].[patients].gender,
[DESCRIPTION] AS Medication,[REASONDESCRIPTION] as Dignosis
FROM [dbo].[patients]
INNER JOIN [dbo].[medications]
ON [dbo].[patients].patient=[dbo].[medications].PATIENT

/* 8. Using the description column in the conditions table, 
write a query that returns all the data for patients who are diabetic (Diabetes) or predibetic (Prediabetes).*/

SELECT * FROM [dbo].[conditions]
WHERE [DESCRIPTION]='diabetes' OR [DESCRIPTION] ='prediabetes'

/* 9. Using the description and reasondescription columns in the table procedures,
write a query that returns a list of all the descriptions for 
a normal pregnancy (Normal pregnancy) except a pregnancy test (Standard pregnancy test).*/

SELECT [DESCRIPTION],[REASONDESCRIPTION]
FROM [dbo].[procedures]
WHERE [REASONDESCRIPTION] = 'normal pregnancy' AND NOT [DESCRIPTION] ='Standard pregnancy test'

/*10. Using the patient, description and value columns in the observations table,
 write a query that returns all the patients expected to have between one and five quality years of life left. 
(Use the description column and “Quality adjusted life years”).*/

SELECT [PATIENT],[DESCRIPTION],[VALUE]
FROM [dbo].[observations]
WHERE [DESCRIPTION] = 'Quality adjusted life years'

/*11. Write a query to show a list of all the asian female patients and the procedures they had.
(Use LEFT OUTER JOIN and join on the patient column from the patient and procedure tables.) 
Include the columns patients.patient, patients.race, patients.ethnicity, patients.gender,
 procedures.description (relabeled procedure), and procedures.r
easondescription (relabeled diagnosis) in your results.*/

SELECT [dbo].[patients].[patient],[race],[ethnicity],[gender],[DESCRIPTION] AS Process,[REASONDESCRIPTION] AS Dignosis
FROM [dbo].[patients] 
LEFT OUTER JOIN [dbo].[procedures]
ON [dbo].[patients].patient=[dbo].[procedures].PATIENT
WHERE [race]='asian' AND [gender]='F'

/*12. Write a query that returns the patient column, the average of the value column relabeled as Avg BMI,
the count of the value column relabeled as Number of readings ,
and the maximum value of the value column filtered for values over 30 and label it as Max Obese BMI.
The query should be written against the observations_cleaned table and the results should all be for
records where the description is “Body Mass Index”. Group your results by the patient column.*/

SELECT [PATIENT], AVG([VALUE]) AS Average_BMI,COUNT([VALUE]) AS Number_of_Readings,MAX([VALUE]) AS Maximum_Obese_BMI
FROM [dbo].[Observation_clean_new] 
WHERE[DESCRIPTION] ='Body Mass Index'
GROUP BY [PATIENT]
HAVING MAX([VALUE])>30
                            

/* 13. Write a query that returns the patient column and a count of all the allergies the patient has from allergies table. 
Group your results by patient, and order them by the number of allergies from greatest to least.*/

SELECT [PATIENT],COUNT([CODE]) AS Number_of_Allergy
FROM [dbo].[allergies]
GROUP BY [PATIENT]
ORDER BY COUNT([CODE]) DESC 

/*14. Write a query that returns the description column, the maximum body height of all the patients, 
and the units from the observations table.*/

SELECT[PATIENT],[DESCRIPTION],[UNITS]
from [dbo].[Observation_clean_new]
where [DESCRIPTION]='Body Height' 


/*15. Write a query that returns the description and the number of patients who have an 
allergy to fish from the allergies table.*/

SELECT [PATIENT],[DESCRIPTION]
FROM [dbo].[allergies]
WHERE [DESCRIPTION]= 'allergy to fish'

/*16. Write a query against the observations_cleaned table using the general CASE expression to return the patient and description columns, 
the average of the value column, and unit column along with a new column labeled BMI category. 
The results are only for the records where the description is Body Mass Index. The entries in
the BMI category column should be Underweight for values under 18.5, Healthy for values from 18.5 to 24.9, 
[Overweight for values of 25-29.9, and Obese for values over 30.*/

SELECT [PATIENT],[DESCRIPTION],[VALUE],[UNITS],
CASE 
WHEN VALUE <18.5 THEN 'Underweight'
when VALUE <24.9 THEN 'Healthy'
when VALUE <29.9  THEN 'Overweight'
when VALUE >=30 THEN 'Obese' 
END
AS BMI_Category
FROM [dbo].[Observation_clean_new]
WHERE [DESCRIPTION]='Body Mass Index'
