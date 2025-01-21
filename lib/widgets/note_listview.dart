import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/helpers/timestamp_helper.dart';
import 'package:tugas_mobile_firebase/models/note_model.dart';
import 'package:tugas_mobile_firebase/services/firestore_service.dart';
import 'package:tugas_mobile_firebase/widgets/note_card.dart';

import '../route/app_route.dart';

class NoteListview extends StatelessWidget {
  const NoteListview({super.key});

  @override
  Widget build(BuildContext context) {
    final FirestoreService firestoreService = FirestoreService();

    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNoteStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;

            // Split the notes into two lists for left and right columns
            final List<NoteModel> leftNotes = [
              for (var i = 0; i < notesList.length; i += 2)
                NoteModel(
                  id: notesList[i].id,
                  title: notesList[i]['note'] ?? '',
                  note: notesList[i]['content'] ?? '',
                  timestamp: formatTimestamp(notesList[i]['timestamp'], false),
                )
            ];
            final List<NoteModel> rightNotes = [
              for (var i = 1; i < notesList.length; i += 2)
                NoteModel(
                  id: notesList[i].id,
                  title: notesList[i]['note'] ?? '',
                  note: notesList[i]['content'] ?? '',
                  timestamp: formatTimestamp(notesList[i]['timestamp'], false),
                )
            ];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left column with alternating notes (use ListView instead of Column)
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: leftNotes.length,
                      itemBuilder: (context, index) {
                        final model = leftNotes[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: NoteCard(
                            ontap: () async {
                              Get.toNamed(AppRoot.note, arguments: [
                                {"docId": model.id}
                              ]);
                              await firestoreService.deleteEmptyNotes();
                            },
                            title: model.title,
                            note: model.note,
                            timestamp: model.timestamp,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 8.0),
                  // Right column with alternating notes (use ListView instead of Column)
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: rightNotes.length,
                      itemBuilder: (context, index) {
                        final model = rightNotes[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: NoteCard(
                            ontap: () async {
                              Get.toNamed(AppRoot.note, arguments: [
                                {"docId": model.id}
                              ]);
                              await firestoreService.deleteEmptyNotes();
                            },
                            title: model.title,
                            note: model.note,
                            timestamp: model.timestamp,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );

          } else {
            return const Center(child: Text('No Notes'));
          }
        },
      ),
    );
  }
}
