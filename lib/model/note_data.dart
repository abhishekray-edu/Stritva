import 'package:flutter/foundation.dart';
import 'note.dart';
import 'emoji.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NoteData with ChangeNotifier {
  List<Note> _notes = [];
  List<Note> get notes => _notes;

  List<Emoji> _emoji = [];
  List<Emoji> get emoji => _emoji;

  bool _isDataLoaded = false;
  bool get isDataLoaded => _isDataLoaded;

  late SharedPreferences prefs; // Initialize the prefs variable

  Future<void> getDataFromPrefs() async {
    prefs = await SharedPreferences.getInstance();

    final encodedEmojiString = prefs.getString('emoji');
    if (encodedEmojiString != null) {
      final encodedData = json.decode(encodedEmojiString);
      _emoji = (encodedData as List).map((e) {
        if (e is Map<String, dynamic>) {
          return Emoji.fromJson(e);
        } else {
          // Handle this case or provide a default Emoji
          return Emoji(
            emoji: '',
            day: DateTime.now(),
            emoji_name: '',
          );
        }
      }).toList();

      final encodedNoteString = prefs.getString('notes');
      if (encodedNoteString != null) {
        final List<Map<String, dynamic>> encodedNote =
            (json.decode(encodedNoteString) as List<dynamic>)
                .map((item) => item as Map<String, dynamic>)
                .toList();

        // Now you have a List<Map<String, dynamic>> in encodedData
        _notes = encodedNote.map((data) => Note.fromJson(data)).toList();
      } else {
        // Handle the case when there's no data in SharedPreferences
        _notes = [];
      }
    }
    _isDataLoaded = true;
    notifyListeners();
    print(_emoji);
  }

  void _saveEmojiToPrefs() {
    final encodedEmoji = _emoji.map((e) => e.toJson()).toList();
    final encodedEmojiString = json.encode(encodedEmoji);
    prefs.setString('emoji', encodedEmojiString);
  }

  void addEmoji(Emoji emoji) {
    _emoji.removeWhere((element) => element.day == emoji.day);
    _emoji.add(emoji);

    _saveEmojiToPrefs();

    notifyListeners();
  }

  void _saveNoteToPrefs() {
    final encodedNote = _notes.map(((e) => e.toJson())).toList();
    final encodedNoteString = json.encode(encodedNote);
    prefs.setString('notes', encodedNoteString);
  }

  void addItem(Note note) {
    _notes.add(note);

    _saveNoteToPrefs();

    notifyListeners();
  }

  void removeItem(Note note) {
    _notes.remove(note);
    _saveNoteToPrefs();
    notifyListeners();
  }
}
