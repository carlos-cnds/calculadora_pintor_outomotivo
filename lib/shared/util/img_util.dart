import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class ImgUtil {
  static Future<String> imgToBase64(String imagepath) async {
    File imagefile = File(imagepath); //convert Path to File
    Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
    String base64string =
        base64.encode(imagebytes); //convert bytes to base64 string
    return base64string;
  }

  static Future<String> imgToBase64ImgBytes(Uint8List imagebytes) async {
    //convert to bytes
    String base64string =
        base64.encode(imagebytes); //convert bytes to base64 string
    return base64string;
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }
}
