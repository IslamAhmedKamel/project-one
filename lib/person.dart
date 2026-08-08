import 'university_member.dart';
import 'utils.dart';

abstract class Person implements UniversityMember {
  String name;
  String? role;
  int _id;

  Person({required this.name, required int id, this.role}) : _id = id;

  int get getId => _id;

  set setId(int id) => _id = id;

  @override
  String getRole() => role ?? "Unknow";

  @override
  String toString() => name;

  @override
  void displayInfo() {
    logInfo("name is :$name    Role is :${getRole()}   Id :$_id");
  }
}
