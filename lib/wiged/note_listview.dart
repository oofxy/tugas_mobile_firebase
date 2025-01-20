import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/models/note_model.dart';
import 'package:tugas_mobile_firebase/route/app_route.dart';
import 'package:tugas_mobile_firebase/services/firestore_service.dart';
import 'package:tugas_mobile_firebase/widgets/note_card.dart';

import '../controllers/dashboard_controller.dart';

class NoteListview extends StatelessWidget {
  const NoteListview({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();
    final FirestoreService firestoreService = FirestoreService();
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNoteStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;

            // Display as a grid
            return GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.8, // Adjust the ratio as needed
              ),
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = notesList[index];
                String docID = document.id;

                // Map data to NoteModel
                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                NoteModel model = NoteModel(
                  id: docID,
                  title: data['note'] ?? "Untitled", // "note" is now the title
                  note: data['content'] ?? "", // "content" is now the note content
                  timestamp: (data['timestamp'] as Timestamp).toDate(),
                );

                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoot.note, arguments: [{"docId": docID}]);
                  },
                  child: NoteCard(
                      title: model.title,
                      note: model.note,
                      timestamp: model.timestamp,
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No Notes'));
          }
        },
      ),
    );
  }
}
