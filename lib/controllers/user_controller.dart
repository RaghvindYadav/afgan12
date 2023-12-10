import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../modal/user.dart';
import '../services/api_provider.dart';

class UserController extends GetxController{
  final apiProvider = ApiProvider();
  late User user;
    userLogin({required String email, required String pass}) async{
      final data = await apiProvider.post("login",{"email":email,"password":pass});
      user = User.fromJson(data);
      GetStorage sr = GetStorage();
      await sr.write('token',user.token);
      await sr.write("user", user);
      print(sr.read('user'));
    }
}