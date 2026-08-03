import 'dart:developer';

import 'person.dart';
import 'university_member .dart';

class StudentMember extends Person implements UniversityMember {
  int? _id;
  StudentMember({required super.name, required super.role});
  int get getId => this._id ?? 0;
  set setId(int id) => this._id = id;

  @override
  void displayInfo() {
    log("name is :$name ****  Role is :$role **** Id :${this._id}");
  }

  @override
  String getRole() {
    return this.role!;
  }
}
