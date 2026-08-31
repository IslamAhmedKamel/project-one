import 'employee_member.dart';
import 'instructor_member.dart';
import 'course.dart';
import 'student_member.dart';
import 'university_system.dart';
import 'utils.dart';

void main() {
  Courses backEnd = Courses(courseName: "BackEnd");
  Courses forntEnd = Courses(courseName: "ForntEnd");
  Courses ai = Courses(courseName: "Ai");
  Courses flutter = Courses(courseName: "Flutter");
  InstructorMember adel = InstructorMember(
    name: "عادل",
    id: 2516,
    role: "Instractor",
    coursesList: [backEnd, forntEnd],
  );
  InstructorMember hassan = InstructorMember(
    name: "حسن",
    role: "Instractor",
    id: 2516,
    coursesList: [flutter, ai],
  );
  EmployeeMember emp1 = EmployeeMember(name: "hassan", id: 22);
  emp1.displayInfo();
  StudentMember islam = StudentMember(
    name: "Islam ",
    role: "Student",
    coursesList: [flutter, backEnd],
    gradesList: [10, 20, 30],
    id: 1212,
    instructors: [adel, hassan],
  );

  StudentMember hany = StudentMember(
    name: "Hany ",
    role: "Student",
    coursesList: [ai, forntEnd],
    gradesList: [15, 80, 30],
    id: 1555,
    instructors: [hassan, adel],
  );
  StudentMember ali = StudentMember(
    name: "ali ",
    role: "Student",
    coursesList: [flutter, backEnd],
    gradesList: [10, 20, 30],
    id: 1212,
    instructors: [hassan],
  );

  InstructorMember ahmed = InstructorMember(
    name: "ahmed",
    id: 5241,
    role: "Instractor",
    coursesList: [flutter],
  );
  UniversitySystem system = UniversitySystem();
  system.addStudent(std: islam);
  system.addStudent(std: ali);
  system.addStudent(std: hany);
  system.enrollStudent(islam);
  system.enrollStudent(hany);
  system.enrollStudent(ali);
  system.displayStudent();
  system.addInstractor(inst: ahmed);
  system.addInstractor(inst: hassan);
  system.addInstractor(inst: adel);
  logInfo(sectionSeparator);
  system.displayInstractor();
}
