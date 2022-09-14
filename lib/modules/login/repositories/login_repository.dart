import 'package:calculadora_pintor_automotivo/models/success.dart';
import 'package:calculadora_pintor_automotivo/models/user.dart';
import 'package:calculadora_pintor_automotivo/shared/services/dio_request.dart';

class LoginRepository {
  static DioRequest _dioRequest = DioRequest();

  static Future<Map<String, dynamic>?> login(
      {required String email, required String password}) async {
    try {
      var response = await _dioRequest.dio
          .post('/user/login', data: {"email": email, "password": password});

      return {
        'success': Success.fromJson(response.data),
        'user': response.data.containsKey('user')
            ? User.fromJson(response.data['user'])
            : null,
        'err_code': response.data.containsKey('err_code')
            ? response.data['err_code']
            : null,
      };
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<Success?> resetPassword({required String email}) async {
    try {
      var response = await _dioRequest.dio
          .post('/user/reset_password', data: {"email": email});

      return Success.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<Success?> refreshPassword(
      {required String email, required String newPassword}) async {
    try {
      var response = await _dioRequest.dio.put('/user/refresh_password',
          data: {"email": email, 'password': newPassword});

      return Success.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
