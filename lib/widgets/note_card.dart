import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_mobile_firebase/models/note_model.dart';

import '../style/colors.dart';
import 'note_card_popup.dart';

class NoteCard extends StatelessWidget {
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
                            NoteCardPopup()
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
              key: widgetKey,
              constraints:  BoxConstraints(
                  minHeight: 184
              ),
              width: 173.5,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onLongPress: () {
                  _showCustomDialog(context, widgetKey);
                  _isHighlighted.value = true;
                },
                onTap: () {},
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
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: 176.0,
                      ),
                      width: 165.5,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              padding: EdgeInsets.all(1),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: isHighlighted ? AppColors.borderPrimaryHighlighted1 : AppColors.borderPrimary
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                ),
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            padding: EdgeInsets.all(14.0),
                            decoration: BoxDecoration(
                                color: isHighlighted ? AppColors.primaryHighlighted : AppColors.primary,
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            constraints: BoxConstraints(
                              minHeight: 176.0,
                            ),
                            width: 165.5,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Les Tittle.",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.0
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                    onTap: () => _showCustomDialog(context, widgetKey),
                                    child: Icon(Icons.more_vert, size: 18.0)
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  constraints: BoxConstraints(minHeight: 84.0),
                                  child: Text(
                                    "wen ome cha in sama tuma har bisaun. wi felin loof ese lifter brau.",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.0
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25.0),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Sep 11th 2001",
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
                                  ),
                                )
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
        }
    );
  }
}