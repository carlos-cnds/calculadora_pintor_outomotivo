import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalFeedBack {
  static Future<bool> show(
      {required BuildContext context,
      required String text,
      required bool isSuccess}) async {
    bool isToDelete = false;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    isSuccess
                        ? Icons.check_circle_outline
                        : Icons.cancel_outlined,
                    size: 40,
                    color: isSuccess ? Colors.green : Colors.red,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$text",
                    style: TextStyle(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: Text(
                          "Ok",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });

    return isToDelete;
  }
}
