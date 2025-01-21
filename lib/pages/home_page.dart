import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/controllers/auth_controller.dart';
import 'package:tugas_mobile_firebase/pages/note_page.dart';
import 'package:tugas_mobile_firebase/route/app_route.dart';
import 'package:tugas_mobile_firebase/services/firestore_service.dart';
import 'package:tugas_mobile_firebase/style/colors.dart';
import 'package:tugas_mobile_firebase/widgets/note_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseController firebaseController = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: const Row(
            children: [
              SizedBox(width: 13),
              Text(
                "quiqiNote.g",
                style: TextStyle(
                    fontFamily: "Inconsolata",
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () => Get.toNamed(AppRoot.profile),
              child: CircleAvatar(
                radius: 23,
                backgroundImage: NetworkImage(
                  firebaseController.user.value?.photoURL ??
                      'https://www.strasys.uk/wp-content/uploads/2022/02/Depositphotos_484354208_S.jpg',
                ),
              ),
            ),
            SizedBox(width: 24),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 16, right: 30, left: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search notes',
                  hintStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: AppColors.onPrimary
                  ),
                  prefixIcon: Icon(Icons.search, color: AppColors.onPrimary,),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: AppColors.borderPrimary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: AppColors.onPrimary, width: 2.0),
                  ),
                  filled: true,
                  fillColor: AppColors.primary, // Background biru
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
              onPressed: () async {
                final FirestoreService firestoreService = FirestoreService();

                // Buat catatan kosong di Firestore
                final String newDocId = await firestoreService.createEmptyNote();

                // Navigasi ke NotePage dengan docId baru
                Get.to(() => const NotePage(), arguments: [{'docId': newDocId}]);
              },
              backgroundColor: AppColors.tertiary,
              shape: const CircleBorder(), // Menjaga tombol tetap bulat
              child: const Icon(Icons.add, color: Colors.white, size: 30.0), // Ukuran ikon diperbesar
          ),
        ),
      )
    );
  }
}