import 'person.dart';
import 'utils.dart';

class EmployeeMember extends Person {
  EmployeeMember({required String name, required int id, String? role})
    : super(name: name, id: id, role: role);

  @override
  void displayInfo() {
    super.displayInfo();
    logInfo(memberSeparator);
  }
}
