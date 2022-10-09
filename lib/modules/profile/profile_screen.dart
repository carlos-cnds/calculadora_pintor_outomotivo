import 'package:pintando_carro/modules/profile/profile_controller.dart';
import 'package:pintando_carro/shared/components/modal_delete.dart';
import 'package:pintando_carro/shared/components/progress_indicator_white.dart';
import 'package:pintando_carro/shared/constants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController(context: context));
    return Scaffold(
      appBar: AppBar(
        title: Text("Pintando Carro"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Meus Dados",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailTextController,
                      enabled: false,
                      decoration: InputDecoration(
                          label: Text("E-mail"),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: ICON_COLOR,
                          ))),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                      keyboardType: TextInputType.text,
                      controller: controller.nameTextController,
                      decoration: InputDecoration(
                          label: Text("Nome"),
                          prefixIcon: Icon(
                            Icons.person,
                            color: ICON_COLOR,
                          ))),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                      keyboardType: TextInputType.number,
                      controller: controller.phoneTextController,
                      inputFormatters: [controller.maskFormatter],
                      decoration: InputDecoration(
                          label: Text("Telefone"),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: ICON_COLOR,
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    return SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          )),
                          onPressed: () {
                            controller.sendForm();
                          },
                          child: controller.loadingSave.value
                              ? ProgressIndicatorWhite()
                              : Text(
                                  "Salvar",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )),
                    );
                  }),
                  SizedBox(
                    height: 5,
                  ),
                  Obx(() {
                    return SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () async {
                            var isToDelete = await ModalDelete.show(
                                context: context,
                                text: "Deseja realmente excluir sua conta?");
                            if (isToDelete) {
                              controller.deleteData();
                            }
                          },
                          child: controller.loadingDelete.value
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator())
                              : Text(
                                  "Excluir minha conta",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.redAccent),
                                )),
                    );
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
