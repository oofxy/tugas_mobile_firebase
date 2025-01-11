import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  //create
  Future<void> addNote (String note){
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now()
    });
  }

  //read
  Stream<QuerySnapshot> getNoteStream() {
    final noteStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return noteStream;
  }

  //update
  Future<void> updateNote(String id, String newNote){
    return notes.doc(id).update({
      'note' : newNote,
      'timestamp' : Timestamp.now()
    });
  }

  //delete
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}