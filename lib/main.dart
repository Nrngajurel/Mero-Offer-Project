import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero/layoutone.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mero Offer',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LayoutOne(),
      // routes: {
      //   '/homepage': (context) => MyHomePage(),
      //   '/search': (context) => SearchPage(title: "Search"),
      //   '/addnewad': (context) => AddNewAdPage(title: "Add New Ad"),
      //   '/message': (context) => MessagePage(title: "Message"),
      //   '/account': (context) => AccountPage(title: "Account"),
      // },
    );
  }
}
