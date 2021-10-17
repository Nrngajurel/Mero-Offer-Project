import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mero/controllers/application-controller.dart';
import 'package:mero/controllers/city-controller.dart';
import 'package:mero/controllers/product-controller.dart';
import 'package:mero/widgets/grid_list_switcher.dart';
import 'package:mero/widgets/gridproduct.dart';
import 'package:mero/widgets/gridproducts.dart';
import 'package:mero/widgets/locationcatfilterrow.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logowhite.png',
                  width: 150,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => Column(
        children: <Widget>[
          LocationCatFilterRow(),
          GridListSwitcher(),
          if(ApplicationController.current_layout.value == 'List')
            Text("list view")
          else
            GridProducts()

        ],
      )),
    );
  }
}
