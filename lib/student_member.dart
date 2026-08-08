import 'course.dart';
import 'exceptions.dart';
import 'instructor_member.dart';
import 'person.dart';
import 'university_member.dart';
import 'validators.dart';

class StudentMember extends Person implements UniversityMember {
  int _id;
  final List<Courses> coursesList;
  final List<InstructorMember> instructors;
  final List<double> gradesList;

  StudentMember({
    required super.name,
    required int id,
    super.role,
    required List<Courses> coursesList,
    required List<double> gradesList,
    required List<InstructorMember> instructors,
  })  : _id = validateId(id),
        coursesList = List<Courses>.from(coursesList),
        instructors = List<InstructorMember>.from(instructors),
        gradesList = List<double>.from(validateGrades(gradesList));

  int get getId => _id;

  set setId(int id) => _id = validateId(id);

  @override
  String toString() => name;

  @override
  void displayInfo() {
    print('name is :$name    Role is :${getRole()}   Id :$_id');
    print(
      coursesList.isNotEmpty
          ? '$name He register this: $coursesList'
          : 'لم يحضر  أي كورس خلال هذه الدورة $name',
    );
    print(
      instructors.isNotEmpty
          ? '$instructors بيشرحله المهندس'
          : 'لا يوجد مهندس مسؤول عن $name',
    );
    print(
      'Avarege  grades for $name is: '
      '${hasGrades ? calculateAverage() : 'لا يوجد درجات برجاء إضافة الدرجات والاعادة'}',
    );

    for (final inst in instructors) {
      inst.displayInfo();
    }
    print('*********************************');
  }

  bool get hasGrades => gradesList.isNotEmpty;

  /// Average of [gradesList].
  ///
  /// Throws [NoGradesException] when the student has no grades yet; callers
  /// that want a placeholder should check [hasGrades] first.
  double calculateAverage() {
    if (gradesList.isEmpty) {
      throw NoGradesException('student $name ($_id) has no grades');
    }
    final total = gradesList.reduce((a, b) => a + b);
    return total / gradesList.length;
  }

  void addGrade(double grade) {
    validateGrades([grade]);
    gradesList.add(grade);
  }

  @override
  String getRole() => role ?? 'Unknown';
}
