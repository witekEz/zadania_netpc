WITH FemaleGrandchildren AS (
    SELECT
        p1.Person_Id AS grandparent_id,
        p2.Person_Id AS parent_id,
        p3.Person_Id AS grandchild_id
    FROM
        zadanie_2.osoby p1
    JOIN
        zadanie_2.osoby p2 ON p1.Person_Id = p2.Mother_Id OR p1.Person_Id = p2.Father_Id
    JOIN
        zadanie_2.osoby p3 ON p2.Person_Id = p3.Mother_Id OR p2.Person_Id = p3.Father_Id
    WHERE
        p3.Sex = 'F'
),
GrandparentCount AS (
    SELECT
        grandparent_id,
        COUNT(grandchild_id) AS female_grandchildren_count
    FROM
        FemaleGrandchildren
    GROUP BY
        grandparent_id
),
MaxGrandparent AS (
    SELECT TOP 1
        grandparent_id,
        female_grandchildren_count
    FROM
        GrandparentCount
    ORDER BY
        female_grandchildren_count DESC
)
SELECT
    p.First_Name,
    p.Last_Name,
    mg.female_grandchildren_count
FROM
    MaxGrandparent mg
JOIN
    zadanie_2.osoby p ON mg.grandparent_id = p.Person_Id;
