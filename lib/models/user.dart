class User {
  String? id;
  String? name;
  String? email;
  String? active;
  String? verified;
  String? verificationCode;
  String? hash;
  String? phoneNumber;
  String? creationDate;
  String? lastAccess;

  User(
      {this.id,
      this.name,
      this.email,
      this.active,
      this.verified,
      this.verificationCode,
      this.hash,
      this.phoneNumber,
      this.creationDate,
      this.lastAccess});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    active = json['active'];
    verified = json['verified'];
    verificationCode = json['verification_code'];
    hash = json['hash'];
    phoneNumber = json['phone_number'];
    creationDate = json['creation_date'];
    lastAccess = json['last_access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['active'] = this.active;
    data['verified'] = this.verified;
    data['verification_code'] = this.verificationCode;
    data['hash'] = this.hash;
    data['phone_number'] = this.phoneNumber;
    data['creation_date'] = this.creationDate;
    data['last_access'] = this.lastAccess;
    return data;
  }
}
