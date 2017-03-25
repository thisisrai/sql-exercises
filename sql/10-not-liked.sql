-- **10:** Find all students who do not appear in the like table (as a student who likes or is liked) and return their names and grades. Sort by grade, then by name within each grade.
-- <br>Write the SQL in the file `sql/10-not-liked.sql`

SELECT
	name, grade
FROM
	student.student
WHERE
	id
		NOT IN (SELECT liker_id FROM student.student_like) AND
	id
		NOT IN (SELECT likee_id FROM student.student_like)
ORDER BY
	grade ASC, name ASC;
