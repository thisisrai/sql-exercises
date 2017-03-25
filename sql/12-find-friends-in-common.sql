-- **12:** For each student A who likes a student B where the two are not friends, find if they have a friend C in common (who can introduce them!). For all such trios, return the name and grade of A, B, and C.
-- <br>Write the SQL in the file `sql/12-find-friends-in-common.sql`

CREATE VIEW Matchmaker AS
SELECT * FROM student.student_like
WHERE likee_id NOT IN (
	SELECT id2 FROM student.friends
	WHERE id1 = liker_id)
AND likee_id NOT IN (
	SELECT id1 FROM student.friends
	WHERE id2 = liker_id);

SELECT a.name, a.grade, b.name, b.grade, c.name, c.grade FROM
	student.student a
	JOIN
		(SELECT liker_id, likee_id, f1.id1 as id1_a FROM Matchmaker
		JOIN student.friends f1
		ON Matchmaker.liker_id = f1.id1
		OR Matchmaker.liker_id = f1.id2
		JOIN student.friends f2
		ON Matchmaker.likee_id = f2.id1
		OR Matchmaker.likee_id = f2.id2
		WHERE f1.id1=f2.id1 OR f1.id2=f2.id1 OR f1.id1=f2.id2 OR f1.id2 = f2.id1)RefinedMatchmaker
	ON
		RefinedMatchmaker.liker_id = a.id
	JOIN
	student.student b
	ON
		RefinedMatchmaker.likee_id = b.id
	JOIN
	student.student c
	ON
		RefinedMatchmaker.id1_a = c.id
	LIMIT 2; 
