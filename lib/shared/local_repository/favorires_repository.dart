import 'package:calculadora_pintor_automotivo/models/product.dart';
import 'package:calculadora_pintor_automotivo/shared/util_functions.dart';
import 'package:hive/hive.dart';

class FavoriteRepository {
  static void insertFavorite({required Product product}) {
    final favBox = Hive.box('favorites');
    if (!favBox.containsKey(product.description)) {
      favBox.put(UtilFunctions.base64Encode(value: product.description!),
          product.toJson());
    }
  }

  static void removeFavorire({required Product product}) {
    final favBox = Hive.box('favorites');
    favBox.delete(UtilFunctions.base64Encode(value: product.description!));
  }

  static List<Product> getFavorites() {
    List<Product> myList = [];
    var item = Hive.box('favorites').toMap();
    if (item == {}) return [];
    item.forEach((k, v) {
      myList.add(Product(
          description: v['description'],
          brand: v['brand'],
          formula: v['formula'],
          imageUrl: v['imageUrl']));
    });
    return myList;
  }

  static clearFavorites() {
    Hive.box('favorites').clear();
  }
}
