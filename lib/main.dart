import '../instructor_member.dart';
import 'course.dart';
import 'employee_member.dart';
import 'student_member.dart';

void main() {
  EmployeeMember emp1 = EmployeeMember(name: "hassan", id: 22);
  emp1.displayInfo();
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
  print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
  InstructorMember shereen = InstructorMember(
    name: "عادل",
    id: 2516,
    coursesList: [],
  );
  shereen.displayInfo();
}
