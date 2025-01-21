import 'package:flutter/material.dart';

import '../style/colors.dart';

class NoteCardPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      height: 92,
      width: 155,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.transparent
      ),
      child: Column(
        children: [
          Material(
            color: AppColors.secondary,
            child: InkWell(
              onTap: () {},
              child: Container(
                color: AppColors.secondary,
                padding: EdgeInsets.only(
                    top: 13,
                    left: 13,
                    right: 13,
                    bottom: 14
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.timer, size: 16.0, color: Colors.black),
                    SizedBox(width: 8.65),
                    Text(
                      'Set reminder',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
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
              onTap: () {},
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
                    Icon(Icons.delete, size: 16.0, color: AppColors.warning,),
                    SizedBox(width: 8.65),
                    Text(
                      'Delete',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
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