class Emoji {
  String emoji;
  DateTime day;
  String emoji_name;

  Emoji({
    required this.emoji,
    required this.day,
    required this.emoji_name,
  });

  factory Emoji.fromJson(Map<String, dynamic> json) {
    return Emoji(
      emoji: json['emoji'] as String,
      day: DateTime.parse(json['day']) as DateTime,
      emoji_name: json['emoji_name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'emoji': emoji,
      'day': day.toIso8601String(),
      'emoji_name': emoji_name,
    };
  }
}
