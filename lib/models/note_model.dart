class NoteModel {
  final String id;
  final String title; // Title berasal dari "note"
  final String note; // Note berasal dari "content"
  final DateTime timestamp;

  NoteModel({
    required this.id,
    required this.title,
    required this.note,
    required this.timestamp,
  });
}
