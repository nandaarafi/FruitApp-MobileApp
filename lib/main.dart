import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fruit_app/core/theme/theme.dart';
import 'package:fruit_app/features/authentication/presentation/screen/onboarding.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


import 'features/navigatiobar/presentation/screen/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      // theme: ThemeData(
      //   primaryColor: Colors.white,
      // ),
      theme: FTheme.lightTheme,
      // darkTheme: AppTheme.get(isLight: false),
      home: NavigationMenu(),
      // home: MyHomePage(title: 'Animated Navigation Bottom Bar'),
    );
  }
}

// class ProductDataModel {
//   String? id;
//   String? image;
//   String? fruit;
//   String? price;
//   String? nutrision;
//   HomeDetails? home;
//   ProductDetails? details;
//
//   ProductDataModel({
//     this.id,
//     this.image,
//     this.fruit,
//     this.price,
//     this.home,
//     this.details,
//     this.nutrision,
//   });
//
//   ProductDataModel.fromJson(Map<String, dynamic> json) {
//     if (json != null) {
//       id = json['id'];
//       image = json['image'];
//       fruit = json['fruit'];
//       price = json['price'];
//       // nutrision = json['details']['nutrision'];
//       // Parse nested 'home' and 'details'
//       home = HomeDetails.fromJson(json['home']);
//       details = ProductDetails.fromJson(json['details']);
//     }
//   }
// }
//
// class HomeDetails {
//   String? subtitle;
//
//   HomeDetails({
//     this.subtitle,
//   });
//
//   HomeDetails.fromJson(Map<String, dynamic> json) {
//     subtitle = json['subtitle'];
//   }
// }
//
// class ProductDetails {
//   String? description;
//   String? expired;
//   String? nutrision;
//
//   ProductDetails({
//     this.description,
//     this.expired,
//     this.nutrision,
//   });
//
//   ProductDetails.fromJson(Map<String, dynamic> json) {
//     description = json['description'];
//     expired = json['expired'];
//     nutrision = json['nutrision'];
//   }
// }
//
//
//
//
//
//
// class JsonDemo extends StatefulWidget {
//   @override
//   _JsonDemoState createState() => _JsonDemoState();
// }
//
// class _JsonDemoState extends State<JsonDemo> {
//   late Dio dio;
//
//   @override
//   void initState() {
//     super.initState();
//     dio = Dio(); // Initialize Dio instance
//
//     // Call your function to get JSON data
//     getJsonData();
//   }
//
//   void getJsonData() async {
//     ProductDataModel product = ProductDataModel.fromJson(
//       {
//         "id": "1",
//         "image": "https://plus.unsplash.com/premium_photo-1671379528112-7b19c77a1d58?q=80&w=1881&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//         "fruit": "Banana",
//         "price": "Rp 50000",
//         "home": {
//           "subtitle": "Taste the difference 25% of all nuts"
//         },
//         "details": {
//           "description": "Bananas are a nutritious and delicious fruit, known for their distinctive curved shape and sweet taste. They are rich in vitamins, minerals, and dietary fiber, making them an excellent snack for any time of the day, Our bananas are carefully selected to ensure the highest quality",
//           "expired": "2 Weeks",
//           "nutrition": "Serving Size: 1 medium mango (200g) Calories 60 Total Fat: 0g Sodium: 0mg Total Carbohydrate: 15g Dietary Fiber: 3g Total Sugars: 12g Protein: 1g"
//         }
//       },
//     );
//
//     String? expire = product.details?.expired;
//     print(expire);
    // try {
    //   final response = await dio.get('https://65bf3116dcfcce42a6f3459e.mockapi.io/test-api/productdata');
    //   List data = response.data;
    //
    //   // Handle the response here, e.g., print the data
    //   data.forEach((element) {
    //     Map obj = element;
    //     Map details = obj['details'];
    //     String expired = details['expired'];
    //     print(expired);
    //   });
    //
    //   // Alternatively, if you want to work with a list of maps, you can do:
    //   // List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(jsonDecode(response.data));
    //
    //   // print(data);
    // } catch (error) {
    //   // Handle error
    //   print("Error fetching data: $error");
    // }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     // Your widget build logic here
//     return Container();
//   }
// }