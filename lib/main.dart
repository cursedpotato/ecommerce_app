
import 'package:ecommerce_app/pages/food/popular_food_detail.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {   
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce app',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
      ),
      home: const PopularFood(),
    );
  }
}

