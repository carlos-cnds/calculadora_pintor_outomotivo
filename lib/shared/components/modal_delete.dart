import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalDelete {
  static Future<bool> show(
      {required BuildContext context, required String text}) async {
    bool isToDelete = false;
    await showDialog(
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
                    Icons.cancel_outlined,
                    size: 100,
                    color: Colors.red,
                  ),
                  Text(
                    "$text",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Text(
                          "Cancelar",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w600),
                        ),
                        onPressed: () => Get.back(),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        child: Text(
                          "Excluir",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () {
                          isToDelete = true;
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
