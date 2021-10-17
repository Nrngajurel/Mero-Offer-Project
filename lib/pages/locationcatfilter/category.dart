import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero/controllers/application-controller.dart';
import 'package:mero/controllers/category-controller.dart';


class CategoryFilter extends StatefulWidget {
  const CategoryFilter({Key? key}) : super(key: key);

  @override
  _CategoryFilterState createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
    // final categoryController = Get.put(CategoryController());
  final CategoryController categoryController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Pick A Category", style: TextStyle(color: Colors.teal),),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
            )
          ],
          iconTheme: IconThemeData(color: Colors.teal),
        ),
        body: Container(
          child: Obx(() => ListView.builder(
              itemCount: categoryController.category.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  // leading: CachedNetworkImage(
                  //   key: UniqueKey(),
                  //   imageUrl: '${ApplicationController.imageBaseUrl}' +
                  //       '${categoryController.category[index].image}',
                  //   height: 35,
                  //   alignment: Alignment.center,
                  // ),
                  title: Text('${categoryController.category[index].name}'),
                  onTap: (){
                    categoryController.setCat(id: categoryController.category[index].id, name: categoryController.category[index].name);
                    Get.back();
                  },

                );

              })),
        ));
  }
}
