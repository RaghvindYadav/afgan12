import 'package:afghan_net/Afgan_List_UI/internet_bundle/vpn_plans/vpn_all.dart';
import 'package:afghan_net/web/catagory/Iran/Iran.dart';
import 'package:afghan_net/web/catagory/afganistan/afganistan.dart';
import 'package:afghan_net/web/catagory/crypto/crypto.dart';
import 'package:afghan_net/web/catagory/diamond/diamond.dart';
import 'package:afghan_net/web/catagory/pubg/pubg.dart';
import 'package:afghan_net/web/catagory/tiktok.dart';
import 'package:afghan_net/web/catagory/turkey/turkey.dart';
import 'package:afghan_net/web/catagory/vimo/vimo.dart';
import 'package:afghan_net/web/catagory/vpn/vpn.dart';
import 'package:afghan_net/web/drawer/drawer.dart';
import 'package:afghan_net/web/widgets/container.dart';
import 'package:afghan_net/widgets/textWeb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageWeb extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  HomePageWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  // width: MediaQuery.of(context).size.width * 0.4,
                  ),
              CustomTextWeb1(text: 'Seller'),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.4,
              // ),
              ClipOval(
                child: Image.asset(
                  'assets/th.jpg',
                  height: 75,
                  width: 70,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: All_Drawer_Web(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 223, 217, 217),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomWalletWeb(
                          text: 'Balance',
                          text1: '0.0 AF',
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.052,
                        ),
                        CustomWalletWeb(
                          text: 'Debit',
                          text1: '0.0 AF',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomWalletWeb(
                          text: 'Sales',
                          text1: '0.0 AF',
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.052,
                        ),
                        CustomWalletWeb(
                          text: 'Benefits',
                          text1: '0.0 AF',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CustomTextWeb1(text: 'Catagory'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => Get.to(() => AfganistanPageWeb()),
                          child: CustomWalletWeb3(
                            image: 'assets/afgan.jpg',
                            text: 'Afghanistan',
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.to(() => IranListWeb()),
                          child: CustomWalletWeb3(
                            image: 'assets/iran.jpeg',
                            text: 'Iran',
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.to(() => TurkeyListWeb()),
                          child: CustomWalletWeb3(
                            image: 'assets/turkey.jpeg',
                            text: 'Turkey',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => Get.to(() => VimoPageWeb()),
                          child: CustomWalletWeb3(
                            text: 'Vimo USD',
                            image: 'assets/vimo.jpeg',
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.to(() => PubgPageWeb()),
                          child: CustomWalletWeb3(
                            text: 'UC PUBG',
                            image: 'assets/pubg.jpeg',
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.to(() => DiamondPageWeb()),
                          child: CustomWalletWeb3(
                            text: 'Imo Diamond',
                            image: 'assets/imo.jpeg',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => Get.to(() => TikTokPageWeb()),
                          child: CustomWalletWeb3(
                            text: 'TikTok Coin',
                            image: 'assets/tiktok.jpeg',
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.to(() => Vpn_CategoryWeb()),
                          child: CustomWalletWeb3(
                            text: 'VPN',
                            image: 'assets/vpn.jpeg',
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.to(() => CCPagrWeb()),
                          child: CustomWalletWeb3(
                              image: 'assets/currency.jpeg',
                              text: 'Crypto Currency'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}

 // _showDialog() {
  //   Get.defaultDialog(
  //       backgroundColor: Colors.white,
  //       title: '',
  //       titleStyle: TextStyle(fontSize: 0, fontWeight: FontWeight.bold),
  //       radius: 0.0,
  //       content: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         // mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.only(right: 48),
  //                 child: Container(
  //                   alignment: Alignment.centerLeft,
  //                   child: Image.asset(
  //                     'assets/images-removebg-preview.png', // Replace with your image asset path
  //                     width: 60.0,
  //                     height: 70.0,
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(right: 61),
  //                 child: Container(
  //                   alignment: Alignment.center,
  //                   child: Image.asset(
  //                     "assets/logo9_13_4390-removebg.png", // Replace with your image asset path
  //                     width: 70.0,
  //                     height: 80.0,
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //               ),
  //               Container(
  //                 alignment: Alignment.centerRight,
  //                 child: Icon(
  //                   Icons.close,
  //                   size: 25,
  //                   color: const Color.fromARGB(255, 61, 78, 107),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               CustomText(
  //                   text: '21-Sep-2023',
  //                   fontSize: 10,
  //                   fontWeight: FontWeight.normal),
  //               SizedBox(
  //                 width: 15,
  //               ),
  //               CustomText(
  //                   text: '12:50PM',
  //                   fontSize: 10,
  //                   fontWeight: FontWeight.normal),
  //             ],
  //           ),
  //           SizedBox(
  //             height: 15,
  //           ),
  //           Padding(
  //             padding: EdgeInsets.only(left: 30, right: 30),
  //             child: Column(
  //               children: [
  //                 const Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(
  //                       'State:',
  //                       // textAlign: TextAlign.center,
  //                       style: TextStyle(
  //                         fontFamily: 'Inter',
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.normal,
  //                         color: Colors.green,
  //                       ),
  //                       softWrap: true, // Enable text wra
  //                     ),
  //                     Text(
  //                       'Pending',
  //                       // textAlign: TextAlign.center,
  //                       style: TextStyle(
  //                         fontFamily: 'Inter',
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.normal,
  //                         color: Colors.green,
  //                       ),
  //                       softWrap: true, // Enable text wra
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: 7,
  //                 ),
  //                 DottedLineHorizontal(
  //                   color: Colors.black,
  //                   height: 0.5,
  //                   lineWidth: 1.0,
  //                   dotWidth: 1.0,
  //                   spacing: 4.0,
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     CustomText(
  //                         text: 'Network type:',
  //                         fontSize: 13,
  //                         fontWeight: FontWeight.normal),
  //                     CustomText(
  //                         text: 'MTN',
  //                         fontSize: 13,
  //                         fontWeight: FontWeight.normal),
  //                   ],
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     CustomText(
  //                         text: 'Bundle type:',
  //                         fontSize: 13,
  //                         fontWeight: FontWeight.normal),
  //                     CustomText(
  //                         text: 'Voice Calling',
  //                         fontSize: 13,
  //                         fontWeight: FontWeight.normal),
  //                   ],
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     CustomText(
  //                         text: 'Phone no:',
  //                         fontSize: 13,
  //                         fontWeight: FontWeight.normal),
  //                     CustomText(
  //                         text: '0770770333',
  //                         fontSize: 13,
  //                         fontWeight: FontWeight.normal),
  //                   ],
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     CustomText(
  //                         text: 'Order no:',
  //                         fontSize: 13,
  //                         fontWeight: FontWeight.normal),
  //                     CustomText(
  //                         text: '1',
  //                         fontSize: 13,
  //                         fontWeight: FontWeight.normal),
  //                   ],
  //                 ),
  //                 DottedLineHorizontal(
  //                   height: 0.5,
  //                   lineWidth: 1.0,
  //                   dotWidth: 1.0,
  //                   spacing: 4.0,
  //                 ),
  //                 const SizedBox(
  //                   height: 15,
  //                 ),
  //                 CustomText(
  //                     text: '1000 minutes MTN to MTN ',
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.bold),
  //                 const Padding(
  //                   padding: EdgeInsets.only(left: 10, right: 10),
  //                   child: SizedBox(
  //                     height: 10,
  //                   ),
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     CustomText(
  //                         text: 'Price',
  //                         fontSize: 13,
  //                         fontWeight: FontWeight.normal),
  //                     CustomText(
  //                         text: '250 AF',
  //                         fontSize: 13,
  //                         fontWeight: FontWeight.normal),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: 9,
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.only(left: 10, right: 10),
  //                   child: DottedLineHorizontal(
  //                     color: Colors.red,
  //                     height: 0.5,
  //                     lineWidth: 1.0,
  //                     dotWidth: 1.0,
  //                     spacing: 4.0,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 15,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(bottom: 15),
  //                   child: CustomText(
  //                       text: 'Just reason Place',
  //                       fontSize: 14,
  //                       fontWeight: FontWeight.normal),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ));
  // }

