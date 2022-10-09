import 'package:pintando_carro/models/success.dart';
import 'package:pintando_carro/models/user.dart';
import 'package:pintando_carro/shared/services/dio_request.dart';

class RegisterRepository {
  static DioRequest _dioRequest = DioRequest();

  static Future<Map<String, dynamic>?> createUser(
      {required String email,
      required String name,
      required String password,
      required String phone}) async {
    try {
      var response = await _dioRequest.dio.post('/user/post', data: {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password
      });

      return {
        'success': Success.fromJson(response.data),
        'user': response.data.containsKey('user')
            ? User.fromJson(response.data['user'])
            : null
      };
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<Success?> activateUser(
      {required String email, required String code}) async {
    try {
      var response = await _dioRequest.dio.post('/user/activate', data: {
        "email": email,
        "code": code,
      });

      return Success.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<Success?> resendCode({required String email}) async {
    try {
      var response = await _dioRequest.dio
          .post('/user/resend_code', data: {"email": email});

      return Success.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
