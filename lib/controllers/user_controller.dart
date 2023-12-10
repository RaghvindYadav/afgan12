import 'dart:convert';

import 'package:afghan_net/services/app_remote_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../modal/user.dart';
import '../services/api_provider.dart';

class UserController extends GetxController{
  final apiProvider = ApiProvider();
  GetStorage sr = GetStorage();
  late User user;
  late List<User> listUsers;

    userLogin({required String email, required String pass}) async{
      final data = await apiProvider.post("login",{"email":email,"password":pass});
      user = User.fromJson(data);
      GetStorage sr = GetStorage();
      await sr.write('token',user.token);
      await sr.write("user", user);
      print(sr.read('user'));
    }

    Future<String> createUser(Map<String,dynamic> userData)async{
        final data = await apiProvider.post('createUser', userData);

        print("message ${data['message']}");
        return data['message'];
    }

    User getUser(){
      if(sr.read('user') is User){
        user = sr.read('user');
      }else{
        user = User.fromJson(sr.read('user'));
      }
      return user;
    }
    
    deleteUser({required String userId}) async{
      final data = await apiProvider.delete("user", {"id":userId});
      print(data);

    }

    Future<List<User>> getAllUsers()async{
      // listUsers.clear();
      final data = await apiProvider.get(AppRemoteRoutes.allUser);
      final List listData = json.decode(jsonEncode(data['data']));
      listUsers =
        listData.map((x)=>User.fromJson(x)).toList();
      return listUsers;
    }

}