1. Top 5 students with the highest GPA (grade point average):
```sql
SELECT student_id, first_name, last_name,
       (SUM(CASE WHEN grade = 'A' THEN 4
                 WHEN grade = 'B' THEN 3
                 WHEN grade = 'C' THEN 2
                 WHEN grade = 'D' THEN 1
                 ELSE 0 END) / COUNT(*)) AS GPA
FROM enrollment
GROUP BY student_id
ORDER BY GPA DESC
LIMIT 5;
```

2. Courses with the highest enrollment and the number of students enrolled:
```sql
SELECT course_id, course_name, COUNT(student_id) AS enrollment_count
FROM enrollment
GROUP BY course_id, course_name
HAVING enrollment_count = (
    SELECT MAX(enrollment_count)
    FROM (SELECT course_id, COUNT(student_id) AS enrollment_count FROM enrollment GROUP BY course_id) AS temp
);
```

3. Students who have enrolled in all the courses in the 'Computer Science' department:
```sql
SELECT s.student_id, s.first_name, s.last_name
FROM student s
WHERE NOT EXISTS (
    SELECT c.course_id
    FROM course c
    WHERE c.department = 'Computer Science'
    EXCEPT
    SELECT e.course_id
    FROM enrollment e
    WHERE e.student_id = s.student_id
);
```

4. Department with the highest average GPA:
```sql
SELECT department, AVG(GPA) AS avg_gpa
FROM (SELECT d.department, e.student_id,
             (SUM(CASE WHEN e.grade = 'A' THEN 4
                       WHEN e.grade = 'B' THEN 3
                       WHEN e.grade = 'C' THEN 2
                       WHEN e.grade = 'D' THEN 1
                       ELSE 0 END) / COUNT(*)) AS GPA
      FROM enrollment e
           JOIN course c ON e.course_id = c.course_id
           JOIN (SELECT DISTINCT department, course_id FROM course) d ON c.course_id = d.course_id
      GROUP BY d.department, e.student_id) AS dept_gpa
GROUP BY department
HAVING avg_gpa = (SELECT MAX(avg_gpa) FROM (SELECT department, AVG(GPA) AS avg_gpa FROM (SELECT d.department, e.student_id, (SUM(CASE WHEN e.grade = 'A' THEN 4 WHEN e.grade = 'B' THEN 3 WHEN e.grade = 'C' THEN 2 WHEN e.grade = 'D' THEN 1 ELSE 0 END) / COUNT(*)) AS GPA FROM enrollment e JOIN course c ON e.course_id = c.course_id JOIN (SELECT DISTINCT department, course_id FROM course) d ON c.course_id = d.course_id GROUP BY d.department, e.student_id) AS dept_gpa GROUP BY department) AS temp);
```

5. Students who have consistently received 'A' grades in all the courses they've enrolled in:
```sql
SELECT s.student_id, s.first_name, s.last_name
FROM student s
WHERE NOT EXISTS (
    SELECT e.grade
    FROM enrollment e
    WHERE e.student_id = s.student_id
    AND e.grade != 'A'
);
```

6. Courses with the highest percentage of 'A' grades:
```sql
WITH CourseGrades AS (
    SELECT c.course_id, c.course_name,
           SUM(CASE WHEN e.grade = 'A' THEN 1 ELSE 0 END) AS A_count,
           COUNT(*) AS total_count
    FROM course c
    JOIN enrollment e ON c.course_id = e.course_id
    GROUP BY c.course_id, c.course_name
)
SELECT course_id, course_name, (A_count * 100.0 / total_count) AS A_percentage
FROM CourseGrades
ORDER BY A_percentage DESC;
```

7. Students who have taken at least one course in both the 'Computer Science' and 'Mathematics' departments:
```sql
SELECT s.student_id, s.first_name, s.last_name
FROM student s
WHERE EXISTS (
    SELECT c.department
    FROM course c
    WHERE c.department = 'Computer Science'
    AND EXISTS (
        SELECT 1
        FROM enrollment e
        WHERE e.student_id = s.student_id
        AND e.course_id = c.course_id
    )
) AND EXISTS (
    SELECT c.department
    FROM course c
    WHERE c.department = 'Mathematics'
    AND EXISTS (
        SELECT 1
        FROM enrollment e
        WHERE e.student_id = s.student_id
        AND e.course_id = c.course_id
    )
);
```

8. Students who have taken a course with 'Prof. Wilson' and 'Prof. Adams' as instructors:
```sql
SELECT s.student_id, s.first_name, s.last_name
FROM student s
WHERE EXISTS (
    SELECT 1
    FROM course c
    WHERE c.instructor = 'Prof. Wilson'
    AND EXISTS (
        SELECT 1
        FROM enrollment e
        WHERE e.student_id = s.student_id
        AND e.course_id = c.course_id
    )
) AND EXISTS (
    SELECT 1
    FROM course c
    WHERE c.instructor = 'Prof. Adams'
    AND EXISTS (
        SELECT 1
        FROM enrollment e
        WHERE e.student_id = s.student_id
        AND e.course_id = c.course_id
    )
);
```

9. Students who have taken courses from at least two different departments:
```sql
SELECT s.student_id, s.first_name, s.last_name
FROM student s
WHERE (
    SELECT COUNT(DISTINCT c.department)
    FROM enrollment e
    JOIN course c ON e.course_id = c.course_id
    WHERE e.student_id = s.student_id
) >= 2;
```

10. Students who have taken more courses than the average number of courses taken by all students:
```sql
SELECT s.student_id, s.first_name, s.last_name, COUNT(e.course_id) AS num_courses
FROM student s
JOIN enrollment e ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING num_courses > (
    SELECT AVG(num_courses)
    FROM (SELECT student_id, COUNT(course_id) AS num_courses FROM enrollment GROUP BY student_id) AS avg_courses
);
```
