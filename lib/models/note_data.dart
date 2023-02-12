import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class NoteData extends ChangeNotifier {
  final _noteList = Hive.box('note_list');

  List<Map<String, dynamic>> items = [];

  List foundNotes = [];
  List allNotes = [];

  final boxKey = Hive.box('boxKey');

  late int classKeyValue;

  void firstCallValue() {
    boxKey.get('key');

    classKeyValue = boxKey.get('key') ?? 0;
  }

  void incrementKey(int key) {
    int keyValue = key + 1;
    boxKey.put('key', keyValue);

    classKeyValue = boxKey.get('key');
    notifyListeners();
  }

  //get all notes
  get getNotes {
    final data = _noteList.keys.map(
      (key) {
        final value = _noteList.get(key);
        return {
          'title': value['title'],
          'note': value['note'],
          'date': value['dateData'],
          'key': key
        };
      },
    ).toList();

    return items = data.reversed.toList();
  }

  ///add note
  void addNote(
    String title,
    String note,
  ) {
    var format = DateFormat.yMMMd().add_jm();
    String dateData = format.format(DateTime.now());
    _noteList.put(classKeyValue.toString(), {
      'dateData': dateData,
      'title': title,
      'note': note,
    });

    incrementKey(classKeyValue);
    foundNotes = NoteData().getNotes;
    allNotes = NoteData().getNotes;

    notifyListeners();
  }

  //setfoundNotes
  void setFoundNotes() {
    foundNotes = NoteData().getNotes;
    allNotes = NoteData().getNotes;
  }

//search
  void changeSearchString(String searchString) {
    if (searchString.isEmpty) {
      foundNotes = allNotes;
    } else {
      foundNotes = allNotes
          .where(
            (note) => note['title'].toString().toLowerCase().contains(
                  searchString,
                ),
          )
          .toList();
    }

    notifyListeners();
  }

//count length
  int get noteCount {
    return _noteList.length;
  }

//delete note
  void deleteNote(
    String key,
  ) {
    _noteList.delete(key);
    foundNotes = NoteData().getNotes;
    allNotes = NoteData().getNotes;

    notifyListeners();
  }

//update note
  void updateNote(
    String key,
    String title,
    String note,
  ) {
    var format = DateFormat.yMMMd().add_jm();
    String dateData = format.format(DateTime.now());
    Map<String, String> updateNoteAtIndex = {
      'dateData': dateData,
      'title': title,
      'note': note,
    };
    _noteList.delete(key);
    _noteList.put(classKeyValue.toString(), updateNoteAtIndex);
    incrementKey(classKeyValue);
    foundNotes = NoteData().getNotes;
    allNotes = NoteData().getNotes;
    notifyListeners();
  }
}
