# database-assignments

# Assignment 4 - Relationship Explanations

1. Customers & Orders (1:N):
   Each customer has a unique identifier and can place multiple orders over time, but every individual order belongs to exactly one customer.

2. Products & Orders (1:N):
   Each product has a unique identifier. A single product may appear in many order records, but each order record refers to only one specific product.

3. Employees & Orders (1:N): 
   Each employee has a unique identifier. A sales employee may process multiple customer orders, but each order is assigned to one sales employee.

4. Employees & Employees / Self-Reference (1:N):
   An employee may report to another employee who acts as a manager. In this hierarchical self-referencing relationship, a manager can supervise several employees.


# Assignment 5 - University Course Registration Database Explanations

1. Instructors to Courses (1:N): Each course is taught by one instructor, but an instructor may teach several courses.
2. Students to Enrollments (1:N): A student can register for multiple courses over time, meaning multiple enrollment records can link to a single student.
3. Courses to Enrollments (1:N): A course can have many student enrollments, while each enrollment record refers to one specific course.
4. How Enrollments Connect Students and Courses: The `Enrollments` table acts as a junction table resolving the many-to-many relationship between students and courses, storing individual grades, dates, and statuses.
5. Preventing Duplicate Registrations: The system prevents a student from registering for the same course twice by enforcing a unique constraint/composite key on the `(Student ID, Course ID)` pair.
