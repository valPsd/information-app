import 'package:flutter/cupertino.dart';
import 'package:information_app/models/information.dart';

class Information_Control extends ValueNotifier<List<Information>> {
  Information_Control._sharedInstance() : super([]);
  static final Information_Control _shared =
      Information_Control._sharedInstance();
  factory Information_Control() => _shared;

  int get length => value.length;

  void add({required Information info}) {
    final infos = value;
    infos.add(info);
    notifyListeners();
  }

  void remove({required Information info}) {
    final infos = value;
    if (infos.contains(info)) {
      infos.remove(info);
      notifyListeners();
    }
  }

  Information? information({required int atIndex}) =>
      value.length > atIndex ? value[atIndex] : null;
}
