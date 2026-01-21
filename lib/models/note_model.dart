class Note {
  final int? id;
  final String title;
  final String content;
  final String createdAt;

  Note({this.id, required this.title, required this.content, required this.createdAt});

  // تحويل البيانات لخريطة (Map) ليتم حفظها في قاعدة البيانات
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt,
    };
  }

  // استرجاع البيانات من قاعدة البيانات وتحويلها لكائن Note
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: map['createdAt'],
    );
  }
}