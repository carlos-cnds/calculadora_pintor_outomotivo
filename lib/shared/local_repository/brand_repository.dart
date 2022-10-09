import 'dart:convert';

import 'package:pintando_carro/models/brand.dart';
import 'package:pintando_carro/shared/services/dio_request.dart';
import 'package:hive/hive.dart';

class BrandRepository {
  static DioRequest _dioRequest = DioRequest();

  static Future<List<Brand>?> getBrands() async {
    try {
      var response = await _dioRequest.dio.get('/brand/get');

      List<Brand> brands = [];

      response.data.forEach((brand) {
        brands.add(Brand.fromJson(brand));
      });

      updateLocal(brands: brands);
      return brands;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static updateLocal({required List<Brand> brands}) {
    final brandsBox = Hive.box('brands');
    brandsBox.put('brands_key',
        brands.map((e) => e.toJson(encondeBase64: true)).toList());
  }

  static List<Brand?> getLocal() {
    final brandsBox = Hive.box('brands').toMap();
    if (brandsBox.isEmpty) {
      return [];
    }
    List<Brand> brands = [];
    brandsBox.forEach((k, v) {
      v.forEach((b) {
        var json = jsonEncode(b);
        brands.add(Brand.fromJson(jsonDecode(json)));
      });
    });
    return brands;
  }

  static clearLocal() {
    Hive.box('brands').clear();
  }
}
