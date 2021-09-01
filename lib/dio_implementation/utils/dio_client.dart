import 'package:dio/dio.dart';
import 'package:learning_flutter/dio_implementation/models/user.dart';
import 'package:learning_flutter/dio_implementation/models/user_info.dart';

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

  Future<UserInfo?> createUser({required UserInfo userInfo}) async {
    UserInfo? retrievedUser;

    try {
      Response response = await _dio.post(
        _baseURL + '/users',
        data: userInfo.toJson(),
      );

      print("User created: ${response.data}");

      retrievedUser = UserInfo.fromJson(response.data);
    } on DioError catch (e) {
      print("Error creating user: $e");
    }
    return retrievedUser;
  }

  Future<UserInfo?> updateUser({
    required UserInfo userInfo,
    required String id,
  }) async {
    UserInfo? updatedUser;

    try {
      Response response = await _dio.put(
        _baseURL + '/users/$id',
        data: userInfo.toJson(),
      );

      print('User updated: ${response.data}');

      updatedUser = UserInfo.fromJson(response.data);
    } catch (e) {
      print('Error updating user: $e');
    }

    return updatedUser;
  }

  Future<void> deleteUser({required String id}) async {
    try {
      await _dio.delete(_baseURL + '/users/$id');
      print('User deleted!');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
