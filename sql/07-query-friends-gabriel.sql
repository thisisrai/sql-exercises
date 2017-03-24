/* **07:** Find the names of all students who are friends with someone named Gabriel.
<br>Write the SQL in the file `sql/07-query-friends-gabriel.sql`*/

/*Step by step that I used to solve the challenge. If the steps are not needed, the last line of code with do the job.*/

/* Picks student ids with the name Gabriel */
SELECT id FROM student.student WHERE name = 'Gabriel';

/* Picks student ids of friends of Gabriel from student.friends table from id1 column*/
SELECT id1 FROM student.friends WHERE id2 IN (SELECT id FROM student.student WHERE name = 'Gabriel');

/* Picks student ids of friends of Gabriel from student.friends table from id2 column*/
SELECT id2 FROM student.friends WHERE id1 IN (SELECT id FROM student.student WHERE name = 'Gabriel');

/*Picks names from student.student table from given ids from line 10 and 12*/
SELECT name from student.student WHERE id IN (SELECT id1 FROM student.friends WHERE id2 IN (SELECT id FROM student.student WHERE name = 'Gabriel')) OR id IN (SELECT id2 FROM student.friends WHERE id1 IN (SELECT id FROM student.student WHERE name = 'Gabriel'));
