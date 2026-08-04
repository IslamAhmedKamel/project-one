import 'course.dart';
import 'person.dart';
import 'university_member.dart';

class InstructorMember extends Person implements UniversityMember {
  int? _id;
  String? name;
  String? role;
  List<Courses>? coursesList;
  InstructorMember({
    required this.name,
    required this._id,
    this.role,
    required this.coursesList,
  }) : super(name: name, role: role);
  @override
  String toString() {
    return name!; // كده لما تطبعه هيطبع الاسم على طول
  }

  int get getId => this._id ?? 0;
  set setId(int id) => this._id = id;
  @override
  void displayInfo() {
    print("name is :$name    Role is :${this.getRole()}   Id :${this._id}");
    print(
      "${coursesList!.isNotEmpty ? '${name} He explains ${coursesList}' : "لم يشرح شيء هذه الدورة $name"}",
    );
  }

  @override
  String getRole() {
    return this.role ?? "Unknow";
  }
}
