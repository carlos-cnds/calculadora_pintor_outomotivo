import 'package:calculadora_pintor_automotivo/models/formula_item.dart';
import 'package:calculadora_pintor_automotivo/shared/services/dio_request.dart';
import 'package:hive/hive.dart';

class FormulaRepository {
  static DioRequest _dioRequest = DioRequest();

  static Future<List<FormulaItem>?> getFormulas() async {
    try {
      var response = await _dioRequest.dio.get('/formula/get');

      List<FormulaItem> formulas = [];

      response.data.forEach((formula) {
        try {
          formulas.add(FormulaItem.fromJson(formula));
        } catch (e) {
          print(e);
        }
      });

      updateLocal(formulasItens: formulas);
      return formulas;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static updateLocal({required List<FormulaItem> formulasItens}) {
    final formulaBox = Hive.box('formula');
    formulaBox.put(
        'formula_key', formulasItens.map((e) => e.toJson()).toList());
  }

  static List<FormulaItem> getLocal() {
    final formulaBox = Hive.box('formula').toMap();
    if (formulaBox.isEmpty) {
      return [];
    }
    List<FormulaItem> formulasItens = [];
    formulaBox.forEach((k, v) {
      v.forEach((b) {
        formulasItens.add(FormulaItem.fromJson(b));
      });
    });
    return formulasItens;
  }

  static clearLocal() {
    Hive.box('formula').clear();
  }
}
