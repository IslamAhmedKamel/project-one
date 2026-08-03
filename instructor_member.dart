import 'dart:developer';
import 'lib/course.dart';
import 'lib/person.dart';
import 'lib/university_member.dart';

class InstructorMember extends Person implements UniversityMember {
  int? _id;
  String? name;
  String? role;
  List<Course>? coursesList;
  InstructorMember({
    required this.name,
    required this._id,
    this.role,
    required this.coursesList,
  }) : super(name: name, role: role);
  int get getId => this._id ?? 0;
  set setId(int id) => this._id = id;
  @override
  void displayInfo() {
    log("name is :$name    Role is :$role   Id :${this._id}");

    log(
      "${coursesList!.isNotEmpty ? '${name}He explains ${coursesList}' : "لم يشرح شيء هذه الدورة $name"}",
    );
    log("*********************************");
  }

  @override
  String getRole() {
    return this.role ?? "Unknow";
  }



}
