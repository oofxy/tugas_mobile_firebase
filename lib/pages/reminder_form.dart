import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/reminder_controller.dart';

class ReminderForm extends StatelessWidget {
  final ReminderController _controller = Get.find();
  final TextEditingController _descriptionController = TextEditingController();
  final Rxn<DateTime> _selectedDateTime = Rxn<DateTime>();

  ReminderForm({super.key});

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
      _controller.addReminder(_selectedDateTime.value!, _descriptionController.text);
      _descriptionController.clear();
      _selectedDateTime.value = null;
    } else {
      Get.snackbar("Error", "Please fill out all fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Reminder")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 20),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDateTime.value != null
                      ? DateFormat.yMd().add_jm().format(_selectedDateTime.value!)
                      : "No date selected",
                ),
                TextButton(
                  onPressed: () => _selectDateTime(context),
                  child: const Text("Select Date & Time"),
                ),
              ],
            )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text("Add Reminder"),
            ),
          ],
        ),
      ),
    );
  }
}
