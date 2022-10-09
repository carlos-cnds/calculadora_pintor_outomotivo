import 'package:pintando_carro/models/success.dart';
import 'package:pintando_carro/shared/services/dio_request.dart';

class ProfileRepository {
  static DioRequest _dioRequest = DioRequest();

  static Future<Success?> updateUser(
      {required String name, required String id, required String phone}) async {
    try {
      var response = await _dioRequest.dio
          .put('/user/update', data: {"name": name, "phone": phone, "id": id});

      return Success.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<Success?> delete({required String id}) async {
    try {
      var response =
          await _dioRequest.dio.delete('/user/delete', data: {"id": id});

      return Success.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
