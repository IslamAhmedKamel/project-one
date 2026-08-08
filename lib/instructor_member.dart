import 'course.dart';
import 'person.dart';
import 'utils.dart';

class InstructorMember extends Person {
  List<Courses>? coursesList;

  InstructorMember({
    required String name,
    required int id,
    String? role,
    required this.coursesList,
  }) : super(name: name, id: id, role: role);

  @override
  void displayInfo() {
    super.displayInfo();
    logInfo(
      describeList(
        coursesList,
        whenPresent: '$name He explains $coursesList',
        whenEmpty: "لم يشرح شيء هذه الدورة $name",
      ),
    );
  }
}
