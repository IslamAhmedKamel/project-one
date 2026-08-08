import 'package:project_one/university_member.dart';
import 'package:test/test.dart';

class _FakeMember implements UniversityMember {
  int displayInfoCalls = 0;

  @override
  void displayInfo() => displayInfoCalls++;

  @override
  String getRole() => 'Fake';
}

void main() {
  group('UniversityMember', () {
    test('implementers satisfy the contract', () {
      final member = _FakeMember();

      member.displayInfo();

      expect(member.displayInfoCalls, 1);
      expect(member.getRole(), 'Fake');
      expect(member, isA<UniversityMember>());
    });
  });
}
