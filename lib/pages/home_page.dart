import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/controllers/auth_controller.dart';
import 'package:tugas_mobile_firebase/services/firestore_service.dart';
import 'package:tugas_mobile_firebase/style/colors.dart';
import 'package:tugas_mobile_firebase/wiged/note_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirestoreService firestoreService = FirestoreService();
    final FirebaseController firebaseController = Get.find();
    final TextEditingController noteController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Text(
                "quiqiNote.g",
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          actions: [
            CircleAvatar(
              radius: 23,
              backgroundImage: NetworkImage(
                firebaseController.user.value?.photoURL ??
                    'https://www.strasys.uk/wp-content/uploads/2022/02/Depositphotos_484354208_S.jpg',
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 24, right: 30, left: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.borderPrimaryHighlighted2), // Border hitam
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.borderPrimaryHighlighted2, width: 2.0), // Border hitam saat fokus
                  ),
                  filled: true,
                  fillColor: AppColors.borderPrimaryHighlighted1, // Background biru
                ),
              ),
            ),
            const Expanded(
              child: NoteListview(),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(
              bottom: 20.0,
              right: 20.0), // Menambahkan jarak dari bawah dan kanan
          child: SizedBox(
            width: 70.0, // Ukuran lebar tombol
            height: 70.0, // Ukuran tinggi tombol
            child: FloatingActionButton(
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
              backgroundColor: AppColors.tertiary,
              child: const Icon(Icons.add,
                  color: Colors.white, size: 40.0), // Ukuran ikon diperbesar
              shape: CircleBorder(), // Menjaga tombol tetap bulat
            ),
          ),
        ));
  }
}
