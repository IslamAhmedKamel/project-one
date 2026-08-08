import 'course.dart';
import 'person.dart';
import 'university_member.dart';
import 'validators.dart';

class InstructorMember extends Person implements UniversityMember {
  int _id;
  final List<Courses> coursesList;

  InstructorMember({
    required super.name,
    required int id,
    super.role,
    required List<Courses> coursesList,
  })  : _id = validateId(id),
        coursesList = List<Courses>.from(coursesList);

  @override
  String toString() => name;

  int get getId => _id;

  set setId(int id) => _id = validateId(id);

  @override
  void displayInfo() {
    print('name is :$name    Role is :${getRole()}   Id :$_id');
    print(
      coursesList.isNotEmpty
          ? '$name He explains $coursesList'
          : 'لم يشرح شيء هذه الدورة $name',
    );
  }

  @override
  String getRole() => role ?? 'Unknown';
}
