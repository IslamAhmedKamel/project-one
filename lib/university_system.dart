import 'course.dart';
import 'enrollment.dart';
import 'instructor_member.dart';
import 'student_member.dart';

class UniversitySystem {
  List<StudentMember> students = [];
  List<InstructorMember> instructors = [];
  List<Courses> courses = [];
  List<Enrollment> enrollments = [];
  void addStudent({required StudentMember std}) {
    students.add(std);
  }

  @override
  String toString() {
    return super.toString();
  }

  displayStudent() {
    for (var student in students) {
      student.displayInfo();
      print("/////////////////////////////////////////////");
    }
  }

  void addInstractor({required InstructorMember inst}) {
    instructors.add(inst);
  }

  displayInstractor() {
    for (var instractor in instructors) {
      instractor.displayInfo();
    }
  }

  void addCourse({required Courses course}) {
    courses.add(course);
  }

  displayCourses() {
    for (var courses in courses) {
      courses.displayInfo();
    }
  }

  void enrollStudent(StudentMember student) {
    enrollments.add(
      Enrollment(student: student, course: student.coursesList ?? []),
    );
    print('Enrolled ${student.name} ');
  }

  List<StudentMember> searchStudents(String query) {
    return students.where((s) => s.name.contains(query)).toList();
  }

  List<Courses> searchCourses(String query) {
    return courses
        .where((course) => course.courseName.contains(query))
        .toList();
  }
}
