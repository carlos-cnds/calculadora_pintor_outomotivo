import 'package:calculadora_pintor_automotivo/models/product.dart';
import 'package:calculadora_pintor_automotivo/modules/formula/components/seletor_diluicao.dart';
import 'package:calculadora_pintor_automotivo/modules/formula/formula_controller.dart';
import 'package:calculadora_pintor_automotivo/shared/local_repository/favorires_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormulaScreen extends StatelessWidget {
  final Product? product;
  final String? brand;
  const FormulaScreen({Key? key, required this.product, required this.brand})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    FormulaController controller =
        Get.put(FormulaController(product: product, brand: brand));
    Color blackAccent = const Color(0xff5c5c5c);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora Pintor Automotivo"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundColor: const Color(0xffE8E8E8),
                    radius: 40,
                    child: CircleAvatar(
                      radius: 39,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(controller.brandImgUrl),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  controller.productsList[0]['marca'],
                  style: TextStyle(
                    color: blackAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              //border:  OutlineInputBorder(),
                              labelText: "Selecionar Item",
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Map<String, dynamic>>(
                                //iconEnabledColor: accentColor,
                                iconSize: 32,
                                isExpanded: true,
                                onChanged: (value) {
                                  controller.selectedProduct.value = value!;
                                  controller.checkIfFavorite();
                                  controller.setDefault();
                                },
                                value: controller.selectedProduct.value,
                                items: controller.productsList
                                    .map((e) =>
                                        DropdownMenuItem<Map<String, dynamic>>(
                                          child: Text(e['descricao']),
                                          value: e,
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Obx(() {
                          bool isFavorite = controller.itemIsFavorite.value;
                          if (isFavorite) {
                            return InkWell(
                              child: const Icon(Icons.favorite,
                                  color: Color(0xffcc2200)),
                              onTap: () {
                                FavoriteRepository.removeFavorire(
                                    product: Product(
                                  brand:
                                      controller.selectedProduct.value['marca'],
                                  description: controller
                                      .selectedProduct.value['descricao'],
                                  imageUrl: controller
                                      .selectedProduct.value['src_imagem'],
                                  formula: controller
                                      .selectedProduct.value['formula'],
                                ));
                                controller.checkIfFavorite();
                              },
                            );
                          } else {
                            return InkWell(
                              child: const Icon(Icons.favorite_border,
                                  color: Colors.black54),
                              onTap: () async {
                                var favorites =
                                    FavoriteRepository.getFavorites();

                                // Se já tiver três favoritos, pede pra substituir
                                if (favorites.length >= 3) {
                                  bool removido = false;
                                  await showDialog(
                                      useSafeArea: false,
                                      context: context,
                                      builder: (context) {
                                        var colorPrimary =
                                            Theme.of(context).primaryColor;
                                        return AlertDialog(
                                          content: SizedBox(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "Ops! Você já possui três favoritos. Escolha um para substituir:",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: colorPrimary),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Column(
                                                  children: favorites
                                                      .map(
                                                          (favorite) => Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            10,
                                                                        left: 5,
                                                                        right:
                                                                            5),
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        favorite
                                                                            .description!,
                                                                        style: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w600,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black54),
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      child: const Icon(
                                                                          Icons
                                                                              .favorite,
                                                                          color:
                                                                              Color(0xffcc2200)),
                                                                      onTap:
                                                                          () {
                                                                        FavoriteRepository.removeFavorire(
                                                                            product:
                                                                                favorite);
                                                                        removido =
                                                                            true;
                                                                        Get.back();
                                                                      },
                                                                    )
                                                                  ],
                                                                ),
                                                              ))
                                                      .toList(),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5, right: 5),
                                              child: InkWell(
                                                child: Text(
                                                  "Cancelar",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: colorPrimary),
                                                ),
                                                onTap: () {
                                                  Get.back();
                                                },
                                              ),
                                            )
                                          ],
                                        );
                                      });

                                  if (removido == true) {
                                    controller.setFavorite();
                                    controller.checkIfFavorite();
                                  }
                                } else {
                                  controller.setFavorite();
                                  controller.checkIfFavorite();
                                }
                              },
                            );
                          }
                        })
                      ],
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "Fórmula:",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Obx(() {
                      return Text(
                        controller.selectedProduct.value['formula'],
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black38),
                      );
                    })
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                Obx(() {
                  return Visibility(
                    visible:
                        true /*controller.selectedProduct.value['possui_diluicao'] == true */,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tipo diluição:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SeletorDiluicao(
                                tipo: "MIN",
                                onTap: () {
                                  controller.tipoDiluicao.value = "min";
                                  controller.setItensFormula();
                                },
                                isCheked:
                                    controller.tipoDiluicao.value == "min"),
                            const SizedBox(
                              width: 10,
                            ),
                            SeletorDiluicao(
                                tipo: "MÉD",
                                onTap: () {
                                  controller.tipoDiluicao.value = "med";
                                  controller.setItensFormula();
                                },
                                isCheked:
                                    controller.tipoDiluicao.value == "med"),
                            const SizedBox(
                              width: 10,
                            ),
                            SeletorDiluicao(
                                tipo: "MAX",
                                onTap: () {
                                  controller.tipoDiluicao.value = "max";
                                  controller.setItensFormula();
                                },
                                isCheked:
                                    controller.tipoDiluicao.value == "max")
                          ],
                        ),
                      ],
                    ),
                  );
                }),
                Column(
                  children: [
                    const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Qtd desejada:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 40,
                                child: Obx(() {
                                  return TextField(
                                    controller: controller.qtdController.value,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [controller.maskFormatter],
                                    onChanged: (text){
                                      controller.setItensFormula();
                                    },
                                  );
                                }),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "ml",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 60,
                                child: Row(
                                  children: [
                                    InkWell(
                                      child: Container(
                                        height: double.infinity,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            shape: BoxShape.circle),
                                        child: const Center(
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        if (controller.getQtdText() == 0) {
                                          return;
                                        }
                                        controller.setQtd(-100);
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      child: Container(
                                        height: double.infinity,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            shape: BoxShape.circle),
                                        child: const Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        controller.setQtd(100);
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          if(controller.isLoading.value){
                            return Container();
                          }
                          return Column(
                            children: controller.formulaItems.value.itensFormula!
                                .map((item) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.black26),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.format_color_fill,
                                                color: Colors.black54,
                                                size: 22,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Flexible(
                                                child: Text(
                                                  item.description!,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black54),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text(
                                              "${item.value!.toStringAsFixed(2).toString().replaceAll('.', ',')} ml",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                                .toList(),
                          );
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
