import 'dart:developer';

import 'person.dart';
import 'university_member.dart';

class EmployeeMember extends Person implements UniversityMember {
  int? _id;
  String? name;
  String? role;
  EmployeeMember({required this.name, required this._id, this.role})
    : super(name: name, role: role);
  int get getId => this._id ?? 0;
  set setId(int id) => this._id = id;
  @override
  void displayInfo() {
    log("name is :$name    Role is :$role   Id :${this._id}");
    log("*********************************");
  }

  @override
  String getRole() {
    return this.role ?? "Unknow";
  }
}
