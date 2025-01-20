import 'package:flutter/material.dart';
import 'package:tugas_mobile_firebase/services/firestore_service.dart';
import 'package:tugas_mobile_firebase/wiged/note_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirestoreService firestoreService = FirestoreService();
    final TextEditingController noteController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: Column(
        children: [
          const Expanded(
            child: NoteListview(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: TextField(
                      controller: noteController,
                      decoration: const InputDecoration(
                        hintText: "Enter your note",
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          firestoreService.addNote(noteController.text);
                          noteController.clear();
                          Navigator.of(context).pop();
                        },
                        child: const Text("Add"),
                      ),
                    ],
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
