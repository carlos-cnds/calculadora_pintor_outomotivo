class Brand {
  String? id;
  String? name;
  String? imgBase64;

  Brand({this.id, this.name, this.imgBase64});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    imgBase64 = json['img_base64'];
  }

  Map<String, dynamic> toJson({required bool encondeBase64}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (encondeBase64) {
      data['img_base64'] = this.imgBase64;
    }

    return data;
  }
}
