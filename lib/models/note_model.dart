class Note {
  final String id;
  final String title;
  final String content;
  final DateTime createdDate;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdDate,
  });

  // تحويل الكائن إلى Map ليتم تخزينه في قاعدة البيانات
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdDate': createdDate.toIso8601String(),
    };
  }

  // تحويل البيانات القادمة من قاعدة البيانات إلى كائن Note
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      createdDate: DateTime.parse(map['createdDate']),
    );
  }
}