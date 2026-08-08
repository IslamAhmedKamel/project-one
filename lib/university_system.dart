import 'course.dart';
import 'enrollment.dart';
import 'exceptions.dart';
import 'instructor_member.dart';
import 'student_member.dart';
import 'validators.dart';

class UniversitySystem {
  final List<StudentMember> students = [];
  final List<InstructorMember> instructors = [];
  final List<Courses> courses = [];
  final List<Enrollment> enrollments = [];

  void addStudent({required StudentMember std}) {
    if (students.any((s) => s.getId == std.getId)) {
      throw DuplicateEntryException(
        'a student with id ${std.getId} is already registered',
      );
    }
    students.add(std);
  }

  void displayStudent() {
    for (final student in students) {
      student.displayInfo();
      print('/////////////////////////////////////////////');
    }
  }

  void addInstractor({required InstructorMember inst}) {
    if (instructors.any((i) => i.getId == inst.getId)) {
      throw DuplicateEntryException(
        'an instructor with id ${inst.getId} is already registered',
      );
    }
    instructors.add(inst);
  }

  void displayInstractor() {
    for (final instractor in instructors) {
      instractor.displayInfo();
    }
  }

  void addCourse({required Courses course}) {
    if (courses.any((c) => c.courseName == course.courseName)) {
      throw DuplicateEntryException(
        'course ${course.courseName} is already registered',
      );
    }
    courses.add(course);
  }

  void displayCourses() {
    for (final course in courses) {
      course.displayInfo();
    }
  }

  /// Enrolls a registered student in the courses they signed up for.
  ///
  /// Throws [MemberNotFoundException] if the student was never added to the
  /// system, [DuplicateEntryException] if they are already enrolled and
  /// [ValidationException] if they have no courses.
  Enrollment enrollStudent(StudentMember student) {
    if (!students.any((s) => s.getId == student.getId)) {
      throw MemberNotFoundException(
        'student ${student.name} (${student.getId}) is not registered; '
        'call addStudent first',
      );
    }
    if (enrollments.any((e) => e.student.getId == student.getId)) {
      throw DuplicateEntryException(
        'student ${student.name} (${student.getId}) is already enrolled',
      );
    }
    final enrollment = Enrollment(
      student: student,
      course: student.coursesList,
    );
    enrollments.add(enrollment);
    print('Enrolled ${student.name}');
    return enrollment;
  }

  List<StudentMember> searchStudents(String query) {
    validateNotBlank(query, 'query');
    return students.where((s) => s.name.contains(query)).toList();
  }

  List<Courses> searchCourses(String query) {
    validateNotBlank(query, 'query');
    return courses
        .where((course) => course.courseName.contains(query))
        .toList();
  }
}
