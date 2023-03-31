import 'package:information_app/models/information.dart';

class Information_Control {
  Information_Control._sharedInstance();
  static final Information_Control _shared =
      Information_Control._sharedInstance();
  factory Information_Control() => _shared;

  final List<Information> _infos = [const Information(name: "Varangkana", surname: "Phasukdee", nickname: "Val", cardID: "1129700202817", email: "varangkana.psd@gmail.com", phoneNum: "0917504417")];

  int get length => _infos.length;

  void add({required Information info}) {
    _infos.add(info);
  }

  void remove({required Information info}) {
    _infos.remove(info);
  }

  Information? information({required int atIndex}) =>
      _infos.length > atIndex ? _infos[atIndex] : null;
}
