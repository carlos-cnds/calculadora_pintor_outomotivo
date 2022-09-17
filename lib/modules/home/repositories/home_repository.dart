import 'package:calculadora_pintor_automotivo/shared/local_repository/brand_repository.dart';

class HomeRepository {
  static Future updateData() async {
    await BrandRepository.getBrands();
  }
}
