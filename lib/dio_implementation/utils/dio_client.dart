import 'package:dio/dio.dart';
import 'package:learning_flutter/dio_implementation/models/user.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseURL = 'https://reqres.in/api';

  Future<User> getUser({required String id}) async {
    User? user;
    try {
      Response userData = await _dio.get(_baseURL + "/users/$id");

      print("User Info: ${userData.data}");

      user = User.fromJson(userData.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }

    return user!;
  }
}
