import 'package:flutter/material.dart';

import '../style/colors.dart';

void dialogConfirmation (BuildContext context, VoidCallback onYes, VoidCallback onNo){
  showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.black12),
            borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Confirmation",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Are you sure?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: 14),
            // Row(
            //   children: [
            //     OutlinedButton(
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: AppColors.primary,
            //           side: BorderSide(color: AppColors.borderPrimary),
            //           padding:
            //           EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            //           shape: RoundedRectangleBorder(
            //             // Set square corners
            //             borderRadius: BorderRadius.all(Radius.circular(5)),
            //           ),
            //         ),
            //         onPressed: () {
            //           onNo;
            //         },
            //         child: Container(
            //           width: double.infinity,
            //           child: Center(
            //             child: Text(
            //               'No',
            //               style: TextStyle(
            //                   color: AppColors.onPrimary,
            //                   fontSize: 16,
            //                   fontFamily: 'Montserrat'),
            //             ),
            //           ),
            //         )
            //     ),
            //     OutlinedButton(
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: AppColors.tertiary,
            //           side: BorderSide(color: AppColors.borderPrimary),
            //           padding:
            //           EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            //           shape: RoundedRectangleBorder(
            //             // Set square corners
            //             borderRadius: BorderRadius.all(Radius.circular(5)),
            //           ),
            //         ),
            //         onPressed: () {
            //           onYes;
            //         },
            //         child: Container(
            //           width: double.infinity,
            //           child: Center(
            //             child: Text(
            //               'Yes',
            //               style: TextStyle(
            //                   color: AppColors.onTertiary,
            //                   fontSize: 16,
            //                   fontFamily: 'Montserrat'),
            //             ),
            //           ),
            //         )
            //     ),
            //   ],
            // )
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
                onPressed: onYes,
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                          color: AppColors.onTertiary,
                          fontSize: 16,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                )
            ),
            SizedBox(height: 8,),
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
                onPressed: onNo,
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'No',
                      style: TextStyle(
                          color: AppColors.onPrimary,
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