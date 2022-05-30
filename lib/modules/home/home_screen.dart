import 'package:calculadora_pintor_automotivo/models/product.dart';
import 'package:calculadora_pintor_automotivo/shared/local_repository/favorires_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora Pintor Automotivo"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: Hive.box('favorites').listenable(),
                builder: (context, box, widget) {
                  List<Product> products = FavoriteRepository.getFavorites();
                  if (products.isNotEmpty) {
                    return Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        children: [
                          const Text("Itens Favoritos",
                              style: TextStyle(
                                color: Color(0xff5c5c5c),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 1,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Color(0xffEDEDED)))),
                          ),
                          Column(
                            children: products
                                .map((favorite) => InkWell(
                                  onTap: (){
                                    Get.toNamed('formula/',
                                    arguments: {'product': favorite, 'brand' : ""});
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Color(0xffEDEDED)))),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                const Color(0xffE8E8E8),
                                            radius: 40,
                                            child: CircleAvatar(
                                              radius: 39,
                                              backgroundImage: AssetImage(
                                                  favorite.imageUrl!),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  favorite.description!,
                                                  style: const TextStyle(
                                                      color: Color(0xff5C5C5C),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(favorite.formula!,
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff888888),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                                  width: 5,
                                                ),
                                          InkWell(
                                            child: const Icon(Icons.favorite,
                                                color: Color(0xffcc2200)),
                                            onTap: () {
                                              FavoriteRepository.removeFavorire(
                                                  product: favorite);
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                ))
                                .toList(),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                }),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Selecionar Marca:",
              style: TextStyle(
                color: Color(0xff5c5c5c),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          child: const CircleAvatar(
                            backgroundColor: Color(0xffE8E8E8),
                            radius: 40,
                            child: CircleAvatar(
                              radius: 39,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                  'assets/images/sherwin_williams.png'),
                            ),
                          ),
                          onTap: () {
                            Get.toNamed('formula/',
                                arguments: {'brand': 'Sherwin Williams'});
                          },
                        ),
                        InkWell(
                          child: const CircleAvatar(
                            backgroundColor: Color(0xffE8E8E8),
                            radius: 40,
                            child: CircleAvatar(
                              radius: 39,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage('assets/images/sikkens.png'),
                            ),
                          ),
                          onTap: () {
                            Get.toNamed('formula/',
                                arguments: {'brand': 'Sikkens'});
                          },
                        ),
                        InkWell(
                          child: const CircleAvatar(
                            backgroundColor: Color(0xffE8E8E8),
                            radius: 40,
                            child: CircleAvatar(
                              radius: 39,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage('assets/images/wanda.png'),
                            ),
                          ),
                          onTap: () {
                            Get.toNamed('formula/',
                                arguments: {'brand': 'Wanda'});
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
