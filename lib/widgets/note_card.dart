import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/models/note_model.dart';

import '../style/colors.dart';
import 'note_card_popup.dart';

class NoteCard extends StatelessWidget {
  // Menerima title, note, dan timestamp sebagai final parameter
  final String title;
  final String note;
  final DateTime timestamp;

  NoteCard({super.key, required this.title, required this.note, required this.timestamp});

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
                        const NoteCardPopup()
                      ],
                    ),
                  ),
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
            key: widgetKey,
            constraints: const BoxConstraints(minHeight: 184),
            width: 173.5,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onLongPress: () => _showCustomDialog(context, widgetKey),
              onHighlightChanged: (isHighlighted) {
                _isHighlighted.value = isHighlighted;
              },
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(2),
                color: Colors.white,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: isHighlighted ? AppColors.borderPrimaryHighlighted2 : Colors.transparent,
                    ),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 176.0),
                    width: 165.5,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: isHighlighted ? AppColors.borderPrimaryHighlighted1 : AppColors.borderPrimary,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                            color: isHighlighted ? AppColors.primaryHighlighted : AppColors.primary,
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                          ),
                          constraints: const BoxConstraints(minHeight: 176.0),
                          width: 165.5,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    title,
                                    style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () => _showCustomDialog(context, widgetKey),
                                    child: const Icon(Icons.more_vert, size: 18.0),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Container(
                                constraints: const BoxConstraints(minHeight: 84.0),
                                child: Text(
                                  note,
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25.0),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${timestamp.day}/${timestamp.month}/${timestamp.year}",
                                      style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 9.0,
                                      height: 9.0,
                                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
