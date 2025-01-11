import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tugas_mobile_firebase/services/firestore_service.dart';

class NoteListview extends StatelessWidget {
  const NoteListview({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController noteController = TextEditingController();
    final FirestoreService firestoreService = FirestoreService();
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: firestoreService.getNoteStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List notesList = snapshot.data!.docs;

              //display as a list
              return ListView.builder(
                itemCount: notesList.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = notesList[index];
                  String docID = document.id;

                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  String noteText = data['note'];

                  return ListTile(
                    title: Text(noteText),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: TextField(
                                    controller: noteController,
                                    decoration: const InputDecoration(
                                      hintText: "Update your current note",
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        firestoreService.updateNote(docID, noteController.text);
                                        noteController.clear();
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Add"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: Icon(Icons.edit, size: 20,)
                        ),
                        //deleted button
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: const Text("Are you sure you want to delete this note?"),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      firestoreService.deleteNote(docID); // Aksi untuk menghapus
                                      noteController.clear(); // Membersihkan teks controller
                                      Navigator.of(context).pop(); // Menutup dialog
                                    },
                                    child: const Text("YES"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Menutup dialog tanpa melakukan apa-apa
                                    },
                                    child: const Text("NO"),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(Icons.delete, size: 20),

                        ),
                      ],
                    )
                  );
                },
              );
            } else{ return const Text('No Notes');}
          }),
    );
  }
}
