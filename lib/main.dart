import 'course.dart';
import 'student_member.dart';

void main() {
  StudentMember std1 = StudentMember(
    name: "Islam Ahmed Kamel",
    role: "Student",
    coursesList: [
      Course(course: "Data analysis"),
      Course(course: "Flutter Developer"),
    ],
    gradesList: [10, 20],
    id: 1212,
  );
  std1.displayInfo();
  StudentMember std2 = StudentMember(
    name: "Adel Hany Ahmed",
    role: "Student",
    coursesList: [
      Course(course: "Frontend Developer"),
      Course(course: "Backend Developer"),
    ],
    gradesList: [],
    id: 4444,
  );
  std2.displayInfo();
}
