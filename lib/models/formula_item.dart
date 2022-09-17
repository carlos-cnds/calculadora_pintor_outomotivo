class FormulaItem {
  Product? product;
  List<Itens>? itens;

  FormulaItem({this.product, this.itens});

  FormulaItem.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    if (json['itens'] != null) {
      itens = <Itens>[];
      json['itens'].forEach((v) {
        itens!.add(new Itens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.itens != null) {
      data['itens'] = this.itens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? id;
  String? description;
  String? formula;
  String? brandId;
  String? brandName;

  Product(
      {this.id, this.description, this.formula, this.brandId, this.brandName});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    formula = json['formula'];
    brandId = json['brand_id'];
    brandName = json['brand_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['formula'] = this.formula;
    data['brand_id'] = this.brandId;
    data['brand_name'] = this.brandName;
    return data;
  }
}

class Itens {
  String? id;
  String? productId;
  String? description;
  double? density;
  double? dilutionMin;
  double? dilutionMed;
  double? dilutionMax;
  double? qtdAux;

  Itens(
      {this.id,
      this.productId,
      this.description,
      this.density,
      this.dilutionMin,
      this.dilutionMed,
      this.dilutionMax});

  Itens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    description = json['description'];
    density = double.parse(json['density'].toString());
    dilutionMin = double.parse(json['dilution_min'].toString());
    dilutionMed = double.parse(json['dilution_med'].toString());
    dilutionMax = double.parse(json['dilution_max'].toString());
    qtdAux = 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['description'] = this.description;
    data['density'] = this.density;
    data['dilution_min'] = this.dilutionMin;
    data['dilution_med'] = this.dilutionMed;
    data['dilution_max'] = this.dilutionMax;
    return data;
  }
}
