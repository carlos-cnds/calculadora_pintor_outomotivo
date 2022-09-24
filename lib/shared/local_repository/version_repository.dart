import 'package:calculadora_pintor_automotivo/shared/services/dio_request.dart';
import 'package:hive/hive.dart';

class VersionRepository {
  static DioRequest _dioRequest = DioRequest();

  static Future<String?> getVersion() async {
    try {
      var response = await _dioRequest.dio.get('/version/get');
      return response.data['updated_at'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  static updateLocal({required String version}) {
    final versionBox = Hive.box('version');
    versionBox.put('version_key', version);
  }

  static String getLocal() {
    final versionBox = Hive.box('version');
    if (versionBox.isEmpty) {
      return "";
    }
    return versionBox.get('version_key');
  }
}
