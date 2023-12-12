import 'package:afghan_net/Afgan_List_UI/internet_bundle/vpn_plans/vpn_all.dart';
import 'package:afghan_net/Afgan_List_UI/status/dialog_box.dart';
import 'package:afghan_net/catagory.dart';
import 'package:afghan_net/controllers/user_controller.dart';
import 'package:afghan_net/order.dart';
import 'package:afghan_net/web/drawer/drawer.dart';
import 'package:afghan_net/widgets/tab_navigate.dart';
import 'package:afghan_net/widgets/text.dart';
import 'package:afghan_net/widgets/transaction.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'widgets/contaierwallat.dart';

class HomePage extends StatelessWidget {
  final List<String> assetImages = [
    'assets/homepage.jpeg',
    'assets/home_2.jpeg',
    'assets/home_3.jpeg',
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    userController.getUser();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: CustomText(
                text: 'Seller',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.14,
              height: MediaQuery.of(context).size.height * 0.065,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/th.jpg', // Replace with your image asset path
                  width: 180.0,
                  height: 180.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      key: _scaffoldKey,
      drawer: All_Drawer_Web(),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 15),
                child: Row(
                  children: [
                    CustomWallet(
                      text: 'Balance',
                      text1: '0.0 AF',
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.052,
                    ),
                    CustomWallet(
                      text: 'Debit',
                      text1: '0.0 AF',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 15),
                child: Row(
                  children: [
                    CustomWallet(
                      text: 'Sales',
                      text1: '0.0 AF',
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.052,
                    ),
                    CustomWallet(
                      text: 'Benefits',
                      text1: '0.0 AF',
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            width: double.infinity, // Width as per design
            height: MediaQuery.of(context).size.height *
                0.25, // Height as per design

            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(10.0), // BorderRadius as per design
            ),
            // Background color as per design (rgba(255, 255, 255, 1))

            child: Container(
              height: 200,
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: assetImages.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 1,
                        // margin: const EdgeInsets.symmetric(horizontal: 3.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 10, right: 10),
          //   child: Container(
          //     //  width: MediaQuery.of(context).size.height * 0.5,
          //     height: MediaQuery.of(context).size.height * 0.5,
          //     decoration: const BoxDecoration(
          //       // Color.fromRGBO(99, 101, 148, 1),
          //       borderRadius: BorderRadius.only(
          //           topRight: Radius.circular(4), topLeft: Radius.circular(4)),
          //     ),
          //     child:

          //   ),
          // ),
          InkWell(
              onTap: () => Get.to(() => ListViewPage()),
              child: CustomWallet32(
                imageItems: 'assets/category-icon-2048x2048-n1l7ihy5.png',
                text: 'Catagories',
              )),
          InkWell(
              onTap: () => Get.to(() => OrderPage1()),
              child: CustomWallet32(
                imageItems: 'assets/order.png',
                text: 'Orders',
              )),

          InkWell(
            onTap: () => Get.to(() => TransactionPage()),
            child: CustomWallet32(
              imageItems: 'assets/transaction1.jpg',
              text: 'Transactions',
            ),
          )
        ]),
      ),
    );
  }
}
