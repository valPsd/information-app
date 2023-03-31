import 'package:uuid/uuid.dart';

class Information {
  final String id;
  final String name;
  final String surname;
  final String nickname;
  final String cardID;
  final String email;
  final String phoneNum;

  Information(
      {required this.name,
      required this.surname,
      required this.nickname,
      required this.cardID,
      required this.email,
      required this.phoneNum}) : id = const Uuid().v4();
}
