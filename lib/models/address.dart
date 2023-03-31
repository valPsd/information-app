import 'package:uuid/uuid.dart';

class Address {
  final String id;
  final String address;
  final String province;
  final String zipCode;
  Address(
      {required this.address, required this.province, required this.zipCode})
      : id = const Uuid().v4();
}
