import 'package:flutter/cupertino.dart';
import 'package:information_app/models/address.dart';

class Address_Control extends ValueNotifier<List<Address>> {
  Address_Control._sharedInstance() : super([]);
  static final Address_Control _shared =
      Address_Control._sharedInstance();
  factory Address_Control() => _shared;

  int get length => value.length;

  void add({required Address address}) {
    final addresses = value;
    addresses.add(address);
    notifyListeners();
  }

  void remove({required Address address}) {
    final addresses = value;
    if (addresses.contains(address)) {
      addresses.remove(address);
      notifyListeners();
    }
  }

  Address? address({required int atIndex}) =>
      value.length > atIndex ? value[atIndex] : null;
}
