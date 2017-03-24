/* **08:** For every student who likes someone 2 or more grades younger than themselves, return that student's name and grade, and the name and grade of the student they like.
<br>Write the SQL in the file `sql/08-query-likes-grade-two-or-more.sql`*/

SELECT
	a.name,
	a.grade,
	b.name,
	b.grade
FROM
	student.student
AS
	a
JOIN
	student.student_like
ON
	a.id = student.student_like.liker_id
JOIN
	student.student
AS
	b
ON
	b.id = student.student_like.likee_id
WHERE
	a.grade - b.grade >= 2;
