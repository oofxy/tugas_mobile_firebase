import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tugas_mobile_firebase/services/firestore_service.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirestoreService firestoreService = FirestoreService();
    final TextEditingController noteController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: Expanded(
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(context: context, builder: (context) => AlertDialog(
                  content: TextField(
                    controller: noteController,
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: (){
                          firestoreService.addNote(noteController.text);
                        },
                        child: Text("Add")
                    )
                  ],
                ));
              },
              child: Icon(Icons.add)
            ),
        )
      ),
    );
  }
}
