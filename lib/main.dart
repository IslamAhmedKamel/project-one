import 'dart:io';

import 'course.dart';
import 'employee_member.dart';
import 'exceptions.dart';
import 'instructor_member.dart';
import 'student_member.dart';
import 'university_system.dart';

void main() {
  try {
    _run();
  } on UniversityException catch (error, stackTrace) {
    stderr.writeln('Failed to run the university demo: $error');
    stderr.writeln(stackTrace);
    exitCode = 1;
  }
}

void _run() {
  final backEnd = Courses(courseName: 'BackEnd');
  final forntEnd = Courses(courseName: 'ForntEnd');
  final ai = Courses(courseName: 'Ai');
  final flutter = Courses(courseName: 'Flutter');

  final adel = InstructorMember(
    name: 'عادل',
    id: 2516,
    role: 'Instractor',
    coursesList: [backEnd, forntEnd],
  );
  final hassan = InstructorMember(
    name: 'حسن',
    role: 'Instractor',
    id: 2517,
    coursesList: [flutter, ai],
  );
  final ahmed = InstructorMember(
    name: 'ahmed',
    id: 5241,
    role: 'Instractor',
    coursesList: [flutter],
  );
  final emp1 = EmployeeMember(name: 'hassan', id: 22);

  final islam = StudentMember(
    name: 'Islam ',
    role: 'Student',
    coursesList: [flutter, backEnd],
    gradesList: [10, 20, 30],
    id: 1212,
    instructors: [adel, hassan],
  );
  final hany = StudentMember(
    name: 'Hany ',
    role: 'Student',
    coursesList: [ai, forntEnd],
    gradesList: [15, 80, 30],
    id: 1555,
    instructors: [hassan, adel],
  );
  final ali = StudentMember(
    name: 'ali ',
    role: 'Student',
    coursesList: [flutter, backEnd],
    gradesList: [10, 20, 30],
    id: 1213,
    instructors: [hassan],
  );

  final system = UniversitySystem();
  for (final course in [backEnd, forntEnd, ai, flutter]) {
    system.addCourse(course: course);
  }
  for (final student in [islam, ali, hany]) {
    system.addStudent(std: student);
    system.enrollStudent(student);
  }
  system.displayStudent();

  for (final instructor in [ahmed, hassan, adel]) {
    system.addInstractor(inst: instructor);
  }
  print('------------------------------');
  system.displayInstractor();
  emp1.displayInfo();
}
