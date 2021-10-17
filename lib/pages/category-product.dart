import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mero/controllers/application-controller.dart';
import 'package:mero/widgets/grid_list_switcher.dart';
import 'package:mero/widgets/gridproducts.dart';
import 'package:mero/widgets/locationcatfilterrow.dart';

class CategoryProduct extends StatefulWidget {
  const CategoryProduct({Key? key, this.category = 'Category'})
      : super(key: key);

  final String category;

  @override
  _CategoryProductState createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("${widget.category}"),
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
