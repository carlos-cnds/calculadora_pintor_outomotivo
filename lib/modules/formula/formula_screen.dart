import 'package:calculadora_pintor_automotivo/models/product.dart';
import 'package:calculadora_pintor_automotivo/modules/formula/components/seletor_diluicao.dart';
import 'package:calculadora_pintor_automotivo/modules/formula/formula_controller.dart';
import 'package:calculadora_pintor_automotivo/shared/constants.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.productsList[0]['marca'],
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundColor: const Color(0xffE8E8E8),
            radius: 20,
            child: CircleAvatar(
              radius: 19,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(controller.brandImgUrl),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Produto:",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                ),
                SizedBox(
                  height: 5,
                ),
                Obx(() {
                  return SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              fillColor: FILL_COLOR,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 3, color: FILL_COLOR)),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              //border:  OutlineInputBorder(),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Map<String, dynamic>>(
                                iconSize: 32,
                                icon: Icon(Icons.keyboard_arrow_down_outlined),
                                isExpanded: true,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87),
                                onChanged: (value) {
                                  controller.selectedProduct.value = value!;
                                  controller.checkIfFavorite();
                                  controller.setDefault();
                                },
                                value: controller.selectedProduct.value,
                                items: controller.productsList
                                    .map((e) =>
                                        DropdownMenuItem<Map<String, dynamic>>(
                                          child: Text(
                                            e['descricao'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87),
                                          ),
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
                                  brand: controller.selectedProduct['marca'],
                                  description:
                                      controller.selectedProduct['descricao'],
                                  imageUrl:
                                      controller.selectedProduct['src_imagem'],
                                  formula:
                                      controller.selectedProduct['formula'],
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
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Obx(() {
                      return Text(
                        controller.selectedProduct['formula'],
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54),
                      );
                    })
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 3,
                  margin: EdgeInsets.only(bottom: 10, top: 5),
                  color: FILL_COLOR,
                ),
                Obx(() {
                  return Visibility(
                    visible:
                        controller.selectedProduct.value['diluicao'].length > 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tipo diluição:",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
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
                        Container(
                          height: 3,
                          margin: EdgeInsets.only(bottom: 5, top: 20),
                          color: FILL_COLOR,
                        ),
                      ],
                    ),
                  );
                }),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Qtd desejada:",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 40,
                            child: Obx(() {
                              return TextField(
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87),
                                controller: controller.qtdController.value,
                                keyboardType: TextInputType.number,
                                inputFormatters: [controller.maskFormatter],
                                onChanged: (text) {
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
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87),
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
                                        color: Theme.of(context).primaryColor,
                                        shape: BoxShape.circle),
                                    child: const Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    if (controller.getQtdText() == 0) {
                                      return;
                                    }
                                    controller.setQtd(-25);
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
                                        color: Theme.of(context).primaryColor,
                                        shape: BoxShape.circle),
                                    child: const Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    controller.setQtd(25);
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return Container();
                      }
                      return Column(
                        children: controller.formulaItems.value.itensFormula!
                            .map((item) => Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                      color: FILL_COLOR,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.format_color_fill,
                                            color: Colors.black87,
                                            size: 20,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Text(
                                              item.description!,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          "${item.value!.toStringAsFixed(2).toString().replaceAll('.', ',')} gr",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18),
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
