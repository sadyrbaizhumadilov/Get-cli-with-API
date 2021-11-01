import 'package:get/get.dart';

import '../user_model.dart';

class UserProvider extends GetConnect {
  @override
  Future<List<dynamic>> getUser() async {
    final response = await get('https://randomuser.me/api/?results=10');
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return response.body['results'];
    }
  }

  Future<Response<User>> postUser(User user) async => await post('user', user);
  Future<Response> deleteUser(int id) async => await delete('user/$id');
}
