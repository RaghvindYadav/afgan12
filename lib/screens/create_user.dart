import 'package:afghan_net/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  String userType = "";
  String currencyType = "";
  final _formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final mobile = TextEditingController();
  final district = TextEditingController();
  final province = TextEditingController();
  final password = TextEditingController();

  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create User'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: firstName,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "First Name",
                            label: const Text('First Name')),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field can't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: lastName,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "Last Name",
                            label: const Text('Last Name')),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field can't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "Email",
                            label: const Text('Email')),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field can't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: mobile,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "Mobile with STD code",
                            label: const Text('Mobile')),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field can't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: district,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "District",
                            label: const Text('District')),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field can't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: province,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "Province",
                            label: const Text('Province')),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field can't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "Password",
                            label: const Text('Password'),
                            suffixIcon: const Icon(Icons.password)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field can't be empty";
                          } else if (value.length < 8) {
                            return "Please create a long password.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PopupMenuButton<String>(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue, width: 1.5),
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text(
                                userType.isEmpty ? "User Type" : userType,
                                style:
                                    TextStyle(fontSize: 18, color: Colors.blue),
                              ),
                            ),
                            onSelected: (String result) {
                              print("Selected: $result");
                              setState(() {
                                userType = result;
                              });
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: 'Admin',
                                child: Text('Admin'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'Regular',
                                child: Text('Regular'),
                              ),
                            ],
                          ),
                          PopupMenuButton<String>(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.green, width: 1.5),
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text(
                                currencyType.isEmpty
                                    ? "Currency Type"
                                    : currencyType,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.green),
                              ),
                            ),
                            onSelected: (String result) {
                              print("Selected: $result");
                              setState(() {
                                currencyType = result;
                              });
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: 'AF',
                                child: Text('AF'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'IR',
                                child: Text('IR'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SizedBox(
                            height: 40,
                            width: 200,
                            child: ElevatedButton(
                                onPressed: () async{
                                  if (_formKey.currentState!.validate()) {
                                    if (currencyType.isEmpty ||
                                        userType.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Make user Currency & UserType is not empty.')));
                                    }else{
                                    final message = await userController.createUser({
                                      "firstName": firstName.text,
                                      "lastName": lastName.text,
                                      "email": email.text,
                                      "mobile": mobile.text,
                                      "district": lastName.text,
                                      "province": province.text,
                                      "password": password.text,
                                      "userType": userType,
                                      "currency": currencyType
                                    });
                                    if(message == "User created successfully"){
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.green,
                                          content: Text(
                                              message,style: const TextStyle(color: Colors.white),)));
                                      Future.delayed(Duration(seconds: 2),(){
                                        Navigator.pop(context,true);
                                      });
                                    }else{
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                          SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                message,style: const TextStyle(color: Colors.white),)));
                                    }
                                    }
                                  }
                                },
                                child: const Text("Create User"))),
                      )
                    ]),
              ),
            ),
          ),
        ));
  }
}
