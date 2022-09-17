import 'package:calculadora_pintor_automotivo/shared/local_repository/brand_repository.dart';
import 'package:calculadora_pintor_automotivo/shared/local_repository/formula_repository.dart';

class HomeRepository {
  static Future updateData() async {
    var brands = BrandRepository.getLocal();
    //if (brands.isNotEmpty) {
    await BrandRepository.getBrands();
    await FormulaRepository.getFormulas();
    //}
  }
}
