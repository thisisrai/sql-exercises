-- **13:** Find the name and grade of all students who are liked by more than one other student.
-- <br>Write the SQL in the file `sql/13-popular-students.sql`


SELECT student.student.name, student.student.grade FROM
	student.student
	JOIN
	(SELECT likee_id FROM
		(SELECT likee_id, count(*) AS likes FROM student.student_like GROUP BY likee_id) LikeesTable
		WHERE
			likes>=2) RefinedLikeesTable
	ON
		RefinedLikeesTable.likee_id = student.student.id;
