import 'person.dart';
import 'university_member.dart';
import 'validators.dart';

class EmployeeMember extends Person implements UniversityMember {
  int _id;

  EmployeeMember({required super.name, required int id, super.role})
      : _id = validateId(id);

  int get getId => _id;

  set setId(int id) => _id = validateId(id);

  @override
  void displayInfo() {
    print('name is :$name    Role is :${getRole()}   Id :$_id');
    print('*********************************');
  }

  @override
  String getRole() => role ?? 'Unknown';
}
