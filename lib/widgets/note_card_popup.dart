import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/widgets/reminder_confirmation.dart';
import 'package:tugas_mobile_firebase/widgets/reminder_dialog.dart';

import '../route/app_route.dart';
import '../services/firestore_service.dart';
import '../style/colors.dart';

class NoteCardPopup extends StatelessWidget {
  NoteCardPopup({super.key, required this.docId});
  final String docId;
  TextEditingController noteController = TextEditingController();
  final FirestoreService firestoreService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      height: 94,
      width: 155,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.transparent
      ),
      child: Column(
        children: [
          Material(
            color: AppColors.secondary,
            child: InkWell(
              onTap: () {
                showReminderDialog(context, noteController, docId);
              },
              child: Container(
                color: AppColors.secondary,
                padding: const EdgeInsets.only(
                    top: 13,
                    left: 13,
                    right: 13,
                    bottom: 14
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset('lib/assets/images/icons/mdi_clock.svg', height: 16.0, width: 16.0),
                    SizedBox(width: 8.65),
                    Text(
                      'Set reminder',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          color: AppColors.textSecondary
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Material(
            color: AppColors.secondary,
            child: InkWell(
              onTap: () {
                dialogConfirmation(context, () async {
                  Get.toNamed(AppRoot.home);
                  await firestoreService.deleteNote(docId);
                }, () {
                  Navigator.of(context, rootNavigator: true).pop(context);
                });
              },
              child: Container(
                color: AppColors.secondary,
                padding: EdgeInsets.only(
                    top: 14,
                    left: 13,
                    right: 13,
                    bottom: 13
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset('lib/assets/images/icons/mdi_delete-empty-outline.svg', height: 16.0, width: 16.0),
                    SizedBox(width: 8.65),
                    Text(
                      'Delete',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          color: AppColors.warningText
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(width: 1, color: AppColors.borderSecondary)),
          )
        ],
      ),
    );
  }
}