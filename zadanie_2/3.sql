WITH FamilyMembers AS (
	SELECT
		o1.Person_Id AS person_id,
		o1.First_Name AS person_name,
		o1.Last_Name AS person_surname,
		o1.Earnings AS person_salary,
		o2.Person_Id AS parent_id,
		o2.Earnings AS person_parent_salary,
		o3.Person_Id AS child_id,
		o3.Earnings AS child_salary,
		CASE
			WHEN o1.Person_Id = m1.Husband_Id THEN m1.Wife_Id
			WHEN o1.Person_Id = m1.Wife_Id THEN m1.Husband_Id
			ELSE NULL
		END AS spouse_id,
		CASE
			WHEN o1.Person_Id = m1.Husband_Id THEN m2.Earnings
			WHEN o1.Person_Id = m1.Wife_Id THEN m2.Earnings
			ELSE NULL
		END AS spouse_salary,
		CASE
			WHEN o2.Person_Id IS NOT NULL THEN 1 ELSE 0
		END AS has_parents,
		CASE
			WHEN o3.Person_Id IS NOT NULL THEN 1 ELSE 0
		END AS has_children,
		(SELECT COALESCE(SUM(spouse_parents.Earnings), 0)
		FROM zadanie_2.osoby spouse
		LEFT JOIN zadanie_2.osoby spouse_parents
		ON spouse.Mother_Id = spouse_parents.Person_Id OR spouse.Father_Id = spouse_parents.Person_Id
		WHERE spouse.Person_Id = CASE
									WHEN o1.Person_Id = m1.Husband_Id THEN m1.Wife_Id
									WHEN o1.Person_Id = m1.Wife_Id THEN m1.Husband_Id
									ELSE NULL
								END
		) AS spouse_parent_salary
	FROM
		zadanie_2.osoby o1
	LEFT JOIN
		zadanie_2.osoby o2 ON o1.Mother_Id = o2.Person_Id OR o1.Father_Id = o2.Person_Id
	LEFT JOIN
		zadanie_2.osoby o3 ON o3.Mother_Id = o1.Person_Id OR o3.Father_Id = o1.Person_Id
	LEFT JOIN
		zadanie_2.malzenstwo m1 ON o1.Person_Id = m1.Husband_Id OR o1.Person_Id = m1.Wife_Id
	LEFT JOIN
		zadanie_2.osoby m2 ON (m1.Husband_Id = m2.Person_Id AND o1.Person_Id != m1.Husband_Id) OR (m1.Wife_Id = m2.Person_Id AND o1.Person_Id != m1.Wife_Id)
),
FamilySalaries AS (
    SELECT
        person_id,
        spouse_id,
        MAX(person_salary) AS person_salary,          COALESCE(SUM (person_parent_salary),0) AS total_parent_salary_person,
		COALESCE(SUM (spouse_parent_salary),0) AS total_parent_salary_spouse,
        COALESCE(SUM(child_salary),0) AS total_child_salary,
        COALESCE(MAX(spouse_salary),0) AS spouse_salary
    FROM
        FamilyMembers fm
    WHERE
        NOT (has_parents = 1 AND has_children = 1)
    GROUP BY
        person_id,
        spouse_id
),
FamilySalariesSum AS(
SELECT
    person_id,
    spouse_id,
    SUM(person_salary) AS person_salary,
    SUM(total_parent_salary_person) AS total_parent_salary_person,
	SUM(total_parent_salary_spouse) AS total_parent_salary_spouse,
    SUM(total_child_salary) AS total_child_salary,
    SUM(spouse_salary) AS spouse_salary
FROM
    FamilySalaries
GROUP BY
    person_id,
    spouse_id
),
PersonSpouseSUM AS(
	SELECT
		person_id,
		spouse_id,
		person_salary+total_parent_salary_person+total_parent_salary_spouse+total_child_salary+spouse_salary AS totalEarnings
	FROM 
		FamilySalariesSum
),
MinSalaryFamily AS (
    SELECT TOP 1
        person_id,
        totalEarnings
    FROM
        PersonSpouseSUM
    ORDER BY
        totalEarnings ASC
)
SELECT
    o.First_Name,
    o.Last_Name,
    msf.totalEarnings
FROM
    MinSalaryFamily msf
JOIN
    zadanie_2.osoby o ON msf.person_id = o.Person_Id;