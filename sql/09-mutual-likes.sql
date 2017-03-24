-- **09:** For every pair of students who both like each other, return the name and grade of both students. Include each pair only once, with the two names in alphabetical order.
-- <br>Write the SQL in the file `sql/09-mutual-likes.sql`

SELECT
	a.name,
	a.grade,
	b.name,
	b.grade,
FROM
	student.student_like
JOIN
	student.student a
ON
	a.id = student.student_like.liker_id
JOIN
	student.student b
ON
	b.id = student.student_like.likee_id
WHERE
	a.id
 	IN (SELECT likee_id FROM student.student_like)
	AND
		b.id < a.id
ORDER BY
	a.name;
