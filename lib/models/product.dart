

class Product {


  String? description;
  String? brand;
  String? imageUrl;
  String? formula;

  Product({required this.description, required this.brand, required this.imageUrl, required this.formula});

Product.fromJson(Map<String, dynamic> json){
  description = json['description'];
  brand = json['brand'];
  imageUrl = json['imageUrl'];
  formula = json['formula'];
}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['brand'] = brand;
    data['imageUrl'] = imageUrl;
    data['formula'] = formula;
    return data;
  }

}