class Note {
  String note;
  DateTime day;

  Note({required this.note, required this.day});

  get date => null;

  Map<String, dynamic> toJson() {
    return {
      'note': note,
      'day': day.toIso8601String(),
    };
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      note: json['note'],
      day: DateTime.parse(json['day']),
    );
  }
}
