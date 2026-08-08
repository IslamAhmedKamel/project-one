import 'course.dart';
import 'instructor_member.dart';
import 'person.dart';
import 'utils.dart';

class StudentMember extends Person {
  List<Courses>? coursesList;
  final List<InstructorMember> instructors;
  List<double> gradesList;

  StudentMember({
    required String name,
    required int id,
    String? role,
    required this.coursesList,
    required this.gradesList,
    required this.instructors,
  }) : super(name: name, id: id, role: role);

  @override
  void displayInfo() {
    super.displayInfo();
    logInfo(
      describeList(
        coursesList,
        whenPresent: '$name He register this: $coursesList',
        whenEmpty: "لم يحضر  أي كورس خلال هذه الدورة $name",
      ),
    );
    logInfo(
      describeList(
        coursesList,
        whenPresent: '$instructors بيشرحله المهندس',
        whenEmpty: "لم يحضر أي كورس خلال هذه الدورة $name",
      ),
    );
    logInfo(
      "Avarege  grades for $name is: ${gradesList.isEmpty ? 'لا يوجد درجات برجاء إضافة الدرجات والاعادة' : calculateAverage()}",
    );

    for (final inst in instructors) {
      inst.displayInfo();
    }
    logInfo(memberSeparator);
  }

  double calculateAverage() {
    if (coursesList == null || coursesList!.isEmpty) {
      return 0.0;
    }
    return average(gradesList);
  }
}
