class NoteModel {
  final String text;
  final String title;
  final DateTime? reminderDate;

  NoteModel({required this.text, required this.title, this.reminderDate});
}
