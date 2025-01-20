import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  //create
  Future<String> createEmptyNote() async {
    try {
      // Tambahkan dokumen baru
      final docRef = await notes.add({
        'note': 'Untitled', // Judul default
        'content': '', // Konten kosong
        'timestamp': Timestamp.now(), // Waktu sekarang
      });

      // Berhasil, kembalikan ID dokumen
      return docRef.id;
    } catch (e) {
      print("Error creating empty note: $e");

      // Query untuk menemukan dokumen dengan content dan note kosong
      final querySnapshot = await notes
          .where('note', isEqualTo: 'Untitled')
          .where('content', isEqualTo: '')
          .limit(1) // Cari hanya satu dokumen
          .get();

      for (var doc in querySnapshot.docs) {
        // Pastikan doc.data() tidak null sebelum akses
        final data = doc.data() as Map<String, dynamic>?;

        if (data != null && (data['note'] ?? '').isEmpty && (data['content'] ?? '').isEmpty) {
          await doc.reference.delete();
          print("Deleted empty note: ${doc.id}");
        }
      }

      throw Exception("Failed to create note, empty note cleaned up");
    }
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

  Future<void> deleteEmptyNotes() async {
    try {
      final querySnapshot = await notes
          .where('note', whereIn: ['', 'Untitled']) // Judul kosong atau "Untitled"
          .where('content', isEqualTo: '') // Konten kosong
          .get();

      for (var doc in querySnapshot.docs) {
        await doc.reference.delete(); // Hapus dokumen yang memenuhi kriteria
        print("Deleted empty note: ${doc.id}");
      }

      if (querySnapshot.docs.isEmpty) {
        print("No empty notes found.");
      }
    } catch (e) {
      print("Error deleting empty notes: $e");
    }
  }

}