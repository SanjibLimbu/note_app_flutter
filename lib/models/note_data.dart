import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NoteData extends ChangeNotifier {
  final _noteList = Hive.box('note_list');

  int get noteCount {
    return _noteList.length;
  }

  get getNotes {
    return _noteList.toMap();
  }

  Future<void> addNote(String title, String note) async {
    await Hive.openBox('note_list');

    Map<String, String> note0 = {'title': title, 'note': note};
    await _noteList.add(note0);
    notifyListeners();
  }
}
