import 'package:calculadora_pintor_automotivo/shared/components/default_app_bar_item.dart';
import 'package:calculadora_pintor_automotivo/shared/constants.dart';
import 'package:calculadora_pintor_automotivo/shared/local_repository/user_local_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = UserLocalRepository.getUser();
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
                color: Theme.of(context).primaryColor,
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 40,
                      child: Icon(
                        Icons.account_circle_rounded,
                        size: 80,
                        color: Colors.grey[300],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Olá, ${user!.name!}",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )),
          ),
          Expanded(
            flex: 7,
            child: Column(
              children: [
                DefaultAppBarItem(
                  iconData: Icons.home,
                  text: "Home",
                  onTap: () {
                    if (Get.currentRoute != ROUTE_HOME) {
                      Get.offAllNamed(ROUTE_HOME);
                    } else {
                      Get.back();
                    }
                  },
                ),
                DefaultAppBarItem(
                    iconData: Icons.exit_to_app,
                    text: "Sair",
                    onTap: () {
                      UserLocalRepository.clearUser();
                      Get.offAllNamed(ROUTE_LOGIN);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
