import 'dart:convert';

class UtilFunctions {
  static base64Encode({required String value}) {
    return base64.encode(utf8.encode(value));
  }

  static base64Decode({required String b64}) {
    return utf8.decode(base64.decode(b64));
  }
}
