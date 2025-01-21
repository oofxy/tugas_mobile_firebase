import 'package:flutter/material.dart';
import 'package:tugas_mobile_firebase/widgets/textfield.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/reminder_controller.dart';
import '../style/colors.dart';

void showReminderDialog(BuildContext context, TextEditingController noteController) {

  final ReminderController _controller = Get.put(ReminderController());
  final TextEditingController _descriptionController = TextEditingController();
  final Rxn<DateTime> _selectedDateTime = Rxn<DateTime>();

  void _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100)
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        _selectedDateTime.value = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute
        );
      }
    }
  }

  void _submitForm() {
    if (_selectedDateTime.value != null && _descriptionController.text.isNotEmpty) {
      Navigator.of(context, rootNavigator: true).pop(context);
      _controller.addReminder(_selectedDateTime.value!, _descriptionController.text);
      _descriptionController.clear();
      _selectedDateTime.value = null;
    } else {
      Get.snackbar("Error", "Please fill out all fields");
    }
  }

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
                controller: _descriptionController,
              ),
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDateTime.value != null
                  ? DateFormat.yMd().add_jm().format(_selectedDateTime.value!) : "No date selected",
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
                  onPressed: () => _selectDateTime(context),
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
                onPressed: _submitForm,
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
