import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/route/app_route.dart';
import 'package:tugas_mobile_firebase/widgets/reminder_dialog.dart';

import '../helpers/timestamp_helper.dart';
import '../services/firestore_service.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController content = TextEditingController();
    TextEditingController noteController = TextEditingController();

    final FirestoreService firestoreService = FirestoreService();
    final String docId = Get.arguments[0]['docId'];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      firestoreService.updateContent(
                          docId, title.text, content.text);
                    },
                    icon: SvgPicture.asset(
                      'lib/assets/images/icons/icon-park-outline_hard-disk-one.svg',
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showReminderDialog(context, noteController);
                    },
                    icon: SvgPicture.asset(
                      'lib/assets/images/icons/mdi_clock.svg',
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'lib/assets/images/icons/mdi_delete-empty-outline.svg',
                    ),
                  ),
                ],
              ),
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: IconButton(
              onPressed: () {
                Get.toNamed(AppRoot.home);
              },
              icon: Transform.rotate(
                angle: 90 * 3.14 / 180,
                child: const Icon(Icons.u_turn_left, size: 31),
              ),
            ),
          ),
        ),
        body: Expanded(
            child: Container(
          color: Colors.white,
          child: FutureBuilder<Map<String, dynamic>>(
            future: firestoreService.getNoteTitle(docId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final noteData = snapshot.data!;
                title =
                    TextEditingController(text: noteData['note'] ?? 'Untitled');
                content = TextEditingController(
                    text: noteData['content'] ?? 'No content available.');
                print(noteData['timestamp'].toString());

                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EditableText(
                        controller: title,
                        cursorColor: Colors.black,
                        backgroundCursorColor: Colors.transparent,
                        focusNode: FocusNode(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        formatTimestamp(noteData['timestamp'], true),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: EditableText(
                          controller: content,
                          maxLines: null,
                          minLines: null,
                          expands: true,
                          cursorColor: Colors.black,
                          backgroundCursorColor: Colors.transparent,
                          focusNode: FocusNode(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            height: 2.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                    child: Text(
                        'There are no exact data can be found in the database. We are truly sorry for our inconvenience that might struck your overall experience using this application.'));
              }
            },
          ),
        )));
  }
}
