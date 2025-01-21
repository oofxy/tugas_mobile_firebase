import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/helpers/timestamp_helper.dart';
import 'package:tugas_mobile_firebase/models/note_model.dart';

import '../style/colors.dart';
import 'note_card_popup.dart';

class NoteCard extends StatelessWidget {
  // Menerima title, note, dan timestamp sebagai final parameter
  final String title;
  final String note;
  final String timestamp;
  final String docId;
  final VoidCallback ontap;

  NoteCard({super.key, required this.title, required this.note, required this.timestamp, required this.ontap, required this.docId});

  final ValueNotifier<bool> _isHighlighted = ValueNotifier(false);

  void _showCustomDialog(BuildContext context, GlobalKey widgetKey) {
    final RenderBox renderBox = widgetKey.currentContext!.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero); // Get the widget's position
    final Size size = renderBox.size; // Get the widget's size
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (_) {
        return GestureDetector(
          onTap: () {
            overlayEntry?.remove();
            _isHighlighted.value = false;
          },
          child: Material(
            color: Colors.transparent, // Transparent background
            child: Stack(
              children: [
                Positioned(
                  top: position.dy + 5, // Top position of the widget
                  right: MediaQuery.of(context).size.width - (position.dx + size.width) + 5,
                  child: GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        Blur(child: Container(color: AppColors.secondary, width: 155, height: 92,), blur: 3),
                        NoteCardPopup(docId: docId)
                      ],
                    )
                  )
                ),
              ],
            ),
          ),
        );
      },
    );

    // Insert the overlay
    Overlay.of(Get.overlayContext!).insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey widgetKey = GlobalKey();

    return ValueListenableBuilder(
        valueListenable: _isHighlighted,
        builder: (context, isHighlighted, child) {
          return Material(
            child: Container(
              width: MediaQuery.of(context).size.width / 2 - 28,
              key: widgetKey,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onLongPress: () {
                  _showCustomDialog(context, widgetKey);
                  _isHighlighted.value = true;
                },
                onTap: () {
                  ontap();
                },
                child: Container(
                  padding: EdgeInsets.all(2),
                  color: Colors.white,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: isHighlighted ? AppColors.borderPrimaryHighlighted2 : Colors.transparent
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      padding: EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: isHighlighted ? AppColors.borderPrimaryHighlighted1 : AppColors.borderPrimary
                        ),
                        color: isHighlighted ? AppColors.primaryHighlighted : AppColors.primary,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            child: Text(
                              note,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.0
                              ),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 25.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                timestamp,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.0
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 9.0,
                                height: 9.0,
                                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}