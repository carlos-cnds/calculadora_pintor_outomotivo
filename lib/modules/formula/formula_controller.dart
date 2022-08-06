import 'package:calculadora_pintor_automotivo/models/item_formula.dart';
import 'package:calculadora_pintor_automotivo/models/product.dart';
import 'package:calculadora_pintor_automotivo/shared/constants.dart';
import 'package:calculadora_pintor_automotivo/shared/local_repository/favorires_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormulaController extends GetxController {
  final Product? product;
  final String? brand;

  FormulaController({required this.product, required this.brand}) {
    setData();
  }

  String brandImgUrl = "";
  var tipoDiluicao = "med".obs;

  List<Map<String, dynamic>> productsList = [];
  var selectedProduct = Map<String, dynamic>().obs;
  var formulaItems = ItensFormula(itensFormula: []).obs;
  var isLoading = false.obs;
  var qtdController = TextEditingController().obs;
  var itemIsFavorite = false.obs;

  void setData() {
    if (product == null) {
      // preenche as informacoes de acordo com a marca selecionada
      productsList =
          products.where((element) => element['marca'] == brand).toList();
      selectedProduct.value = productsList[0];
      brandImgUrl = productsList[0]['src_imagem'];
      qtdController.value.text = "100";
    } else {
      // preenche as informacoes de acordo com o produto selecionado
      productsList = products
          .where((element) => element['marca'] == product!.brand)
          .toList();
      brandImgUrl = productsList[0]['src_imagem'];
      selectedProduct.value = productsList
          .where((element) => element['descricao'] == product!.description)
          .first;
      qtdController.value.text = "100";
    }

    setItensFormula();
    checkIfFavorite();
  }

  void setDefault() {
    tipoDiluicao.value = "med";
    setItensFormula();
  }

  var maskFormatter =
      MaskTextInputFormatter(mask: '####', filter: {"#": RegExp(r'[0-9]')});

  void setItensFormula() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 50));

    if (selectedProduct.isEmpty) {
      isLoading.value = false;
      return;
    }
    int qtd = 0;
    if (qtdController.value.text.isNotEmpty) {
      qtd = int.parse(qtdController.value.text);
    }
    formulaItems.value.itensFormula!.clear();
    selectedProduct['items'].forEach((element) {
      double value = 0;
      if (qtd == 0) {
        value = 0;
      } else {
        value = (qtd.toDouble() *
                element['percentual_base_gm_d${tipoDiluicao.value}'] /
                baseCalculo) *
            element['densidade'];
      }
      formulaItems.value.itensFormula!.add(ItemFormula(
          description: element['descricao'], un: 'un', value: value));
    });
    isLoading.value = false;
  }

  void checkIfFavorite() {
    var favorites = FavoriteRepository.getFavorites();
    var qtd = favorites
        .where((element) => element.description == selectedProduct['descricao'])
        .length;
    if (qtd == 0) {
      itemIsFavorite.value = false;
    } else {
      itemIsFavorite.value = true;
    }
  }

  void setFavorite() {
    FavoriteRepository.insertFavorite(
        product: Product(
      brand: selectedProduct['marca'],
      description: selectedProduct['descricao'],
      imageUrl: selectedProduct['src_imagem'],
      formula: selectedProduct['formula'],
    ));
  }

  int getQtdText() {
    if (qtdController.value.text.isEmpty) {
      return 0;
    }
    return int.parse(qtdController.value.text);
  }

  void setQtd(int qtd) {
    var qtdAtual = getQtdText();
    qtdAtual += qtd;
    if (qtdAtual <= 0) {
      qtdController.value.text = "0";
    } else if (qtdAtual >= 1000) {
      qtdController.value.text = "1000";
    } else {
      qtdController.value.text = qtdAtual.toString();
    }
    setItensFormula();
  }
}
