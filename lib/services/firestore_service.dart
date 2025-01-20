import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  //create
  Future<void> addNote (String note){
    return notes.add({
      'note': note,
      'content' : "",
      'timestamp': Timestamp.now()
    });
  }

  //read
  Stream<QuerySnapshot> getNoteStream() {
    final noteStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return noteStream;
  }

  // Future<Map<String, dynamic>> getNoteTitle(String id) async {
  //   DocumentSnapshot doc = await notes.doc(id).get();
  //   return doc.data() as Map<String, dynamic>;
  // }

  Future<Map<String, dynamic>> getNoteTitle(String id) async {
    try {
      final doc = await notes.doc(id).get();
      return doc.data() as Map<String, dynamic>;
    } catch (e) {
      print("Error fetching document: $e");
      return {};
    }
  }

  //update
  Future<void> updateNote(String id, String newNote){
    return notes.doc(id).update({
      'note' : newNote,
    });
  }

  Future<void> updateContent(String id, String newNote, String newContent){
    return notes.doc(id).update({
      'note' : newNote,
      'content' : newContent,
    });
  }

  //delete
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}