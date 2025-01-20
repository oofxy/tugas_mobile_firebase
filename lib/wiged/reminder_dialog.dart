import 'package:flutter/material.dart';
import 'package:tugas_mobile_firebase/wiged/textfield.dart';

import '../style/colors.dart';

void showReminderDialog(BuildContext context, TextEditingController noteController) {
  showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.black12),
            borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              child: Center(
                child: Text(
                  "Reminder",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Description",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: 8,),
            Material(
              child: mainTextField(
                hintText: "Enter description.",
              ),
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "No date selected.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                  ),
                ),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    side: BorderSide(color: AppColors.borderPrimary),
                    padding:
                    EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      // Set square corners
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  onPressed: () {
                  },
                  child: Text(
                    'Select date & time',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            OutlinedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.tertiary,
                  side: BorderSide(color: AppColors.borderPrimary),
                  padding:
                  EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    // Set square corners
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                onPressed: () {
                },
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Add reminder',
                      style: TextStyle(
                          color: AppColors.onTertiary,
                          fontSize: 16,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                )
            ),
          ],
        ),
      )
  );
}
