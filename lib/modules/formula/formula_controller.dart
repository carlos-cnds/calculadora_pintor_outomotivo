import 'package:pintando_carro/models/formula_item.dart';
import 'package:pintando_carro/shared/local_repository/favorires_repository.dart';
import 'package:pintando_carro/shared/local_repository/formula_repository.dart';
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

  List<Product> productsOfBrand = [];
  var itensOfSelectedProducBase = <Itens>[].obs;
  var itensOfSelectedProducCalc = <Itens>[].obs;
  var selectedProduct = Product().obs;

  List<FormulaItem> formulaList = FormulaRepository.getLocal();
  var isLoading = false.obs;
  var qtdController = TextEditingController(text: "100").obs;
  var itemIsFavorite = false.obs;
  var qtdtotal = 0.0.obs;

  void setData() {
    if (product == null) {
      var itensOfFormula = formulaList
          .where((element) => element.product!.brandName == brand)
          .toList();
      int counter = 0;
      itensOfFormula.forEach((element) {
        productsOfBrand.add(element.product!);
        if (counter == 0) {
          selectedProduct.value = productsOfBrand[0];
        }
        counter++;
      });
    } else {
      var itensOfFormula = formulaList
          .where((element) => element.product!.brandName == product!.brandName!)
          .toList();
      int counter = 0;
      itensOfFormula.forEach((element) {
        productsOfBrand.add(element.product!);
        if (element.product!.id == product!.id) {
          selectedProduct.value = productsOfBrand[counter];
        }
        counter++;
      });
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

  void setItensFormula() {
    itensOfSelectedProducBase.clear();
    itensOfSelectedProducCalc.clear();
    var itensOfFormula = formulaList
        .where((element) => element.product!.id == selectedProduct.value.id)
        .toList();
    int counter = 0;
    itensOfFormula.forEach((element) {
      if (counter == 0) {
        itensOfSelectedProducBase.addAll(element.itens!);
        itensOfSelectedProducCalc.addAll(element.itens!);
      }
      counter++;
    });

    // fazer o calculo da quantidade
    var qtd = int.tryParse(qtdController.value.text);
    double dilution = 0;
    for (var i = 0; i < itensOfSelectedProducBase.length; i++) {
      if (tipoDiluicao.value == "min") {
        dilution = itensOfSelectedProducBase[i].dilutionMin!;
      } else if (tipoDiluicao.value == "med") {
        dilution = itensOfSelectedProducBase[i].dilutionMed!;
      } else {
        dilution = itensOfSelectedProducBase[i].dilutionMax!;
      }
      double density = itensOfSelectedProducBase[i].density!;
      if (qtd == null) {
        itensOfSelectedProducCalc[i].qtdAux = 0;
      } else if (qtd == 0) {
        itensOfSelectedProducCalc[i].qtdAux = 0;
      } else {
        itensOfSelectedProducCalc[i].qtdAux =
            ((dilution * qtd) / 100) * density;
      }
    }
    updateQtdtotal();
  }

  void updateQtdtotal() {
    qtdtotal.value = 0;
    itensOfSelectedProducCalc.forEach((element) {
      if (element.selectAux!) {
        qtdtotal.value += element.qtdAux!;
      }
    });
  }

  updateSelection(Itens item) {
    itensOfSelectedProducCalc.forEach((element) {
      if (element.id! == item.id) {
        element.selectAux = !element.selectAux!;
      }
    });
    updateQtdtotal();
  }

  void checkIfFavorite() {
    var favorites = FavoriteRepository.getFavorites();
    itemIsFavorite.value = favorites
        .where((element) => element.id == selectedProduct.value.id)
        .isNotEmpty;
  }

  void setFavorite() {
    FavoriteRepository.insertFavorite(product: selectedProduct.value);
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
