import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero/controllers/application-controller.dart';

class GridListSwitcher extends StatefulWidget {
  const GridListSwitcher({Key? key}) : super(key: key);

  @override
  _GridListSwitcherState createState() => _GridListSwitcherState();
}

class _GridListSwitcherState extends State<GridListSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: (){
              ApplicationController.current_layout.value = 'List';
            },
            child: Container(
              // color: Colors.blue,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              constraints: BoxConstraints(
              ),
              child: Obx(()=>Icon(Icons.format_list_bulleted, color: ApplicationController.current_layout.value == 'List'?Colors.black : Colors.black54,)),
            ),
          ),
          InkWell(
            onTap: (){
              ApplicationController.current_layout.value = 'Grid';
            },
            child: Container(
              // color: Colors.blue,
              padding: EdgeInsets.all(5),
              constraints: BoxConstraints(
              ),
              child: Obx(()=>Icon(Icons.grid_view, color: ApplicationController.current_layout.value == 'Grid'?Colors.black : Colors.black54)),
            ),
          ),

        ],
      ),
    );
  }
}
