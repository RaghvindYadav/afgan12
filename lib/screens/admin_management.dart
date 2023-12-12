import 'package:afghan_net/controllers/user_controller.dart';
import 'package:afghan_net/screens/create_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminManagement extends StatefulWidget {
  const AdminManagement({super.key});

  @override
  State<AdminManagement> createState() => _AdminManagementState();
}

class _AdminManagementState extends State<AdminManagement> {
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Management"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.green)),
                      child: ListTile(
                        leading: const Icon(
                          Icons.create,
                          color: Colors.green,
                        ),
                        title: const Text(
                          "Create User",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Get.to(()=>CreateUser());
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.red)),
                      child: ListTile(
                        leading: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        title: const Text(
                          "Deleted User",
                          style: TextStyle(color: Colors.red),
                        ),
                        onTap: () {
                          // route for delete user page
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: FutureBuilder(
                    future: userController.getAllUsers(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: userController.listUsers.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Dismissible(
                                background: Container(color: Colors.red,),
                                onDismissed: (direction) async{
                                    await userController.deleteUser(userId: userController.listUsers[index].id);

                                    setState(() {
                                    userController.listUsers.removeAt(index);
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('${userController.listUsers[index].firstName} deleted'),
                                    ),
                                  );
                                },
                                key: Key(userController.listUsers[index].id),
                                child: ListTile(
                                  leading: const Icon(Icons.account_circle),
                                  title: Text(
                                      "${userController.listUsers[index].firstName} ${userController.listUsers[index].lastName}"),
                                  subtitle: Text(
                                      userController.listUsers[index].email ??
                                          userController.listUsers[index].mobile
                                              .toString()),
                                  trailing: Text(
                                      userController.listUsers[index].userType),
                                ),
                              );
                            });
                      }
                      return const Center(child: CircularProgressIndicator());
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
