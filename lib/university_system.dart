import 'course.dart';
import 'enrollment.dart';
import 'instructor_member.dart';
import 'student_member.dart';
import 'university_member.dart';
import 'utils.dart';

class UniversitySystem {
  List<StudentMember> students = [];
  List<InstructorMember> instructors = [];
  List<Courses> courses = [];
  List<Enrollment> enrollments = [];

  void addStudent({required StudentMember std}) {
    students.add(std);
  }

  void addInstractor({required InstructorMember inst}) {
    instructors.add(inst);
  }

  void addCourse({required Courses course}) {
    courses.add(course);
  }

  void displayStudent() {
    _displayAll(students, separator: recordSeparator);
  }

  void displayInstractor() {
    _displayAll(instructors);
  }

  void displayCourses() {
    for (final course in courses) {
      course.displayInfo();
    }
  }

  void _displayAll(List<UniversityMember> members, {String? separator}) {
    for (final member in members) {
      member.displayInfo();
      if (separator != null) {
        logInfo(separator);
      }
    }
  }

  void enrollStudent(StudentMember student) {
    enrollments.add(
      Enrollment(student: student, course: student.coursesList ?? []),
    );
    logInfo('Enrolled ${student.name} ');
  }

  List<StudentMember> searchStudents(String query) {
    return searchBy(students, query, (student) => student.name);
  }

  List<Courses> searchCourses(String query) {
    return searchBy(courses, query, (course) => course.courseName);
  }
}
