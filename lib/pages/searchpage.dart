import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mero/controllers/category-controller.dart';
import 'package:get/get.dart';
import 'package:mero/controllers/product-controller.dart';
import 'package:mero/pages/category-product.dart';
import 'package:mero/widgets/locationcatfilterrow.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final CategoryController categoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          LocationCatFilterRow(),
          Expanded(
            child: Obx(() => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0),
                  itemCount: categoryController.category.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12)),
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                key: UniqueKey(),
                                imageUrl: '${ProductController.imageBaseUrl}' +
                                    '${categoryController.category[index].image}',
                                height: 35,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${categoryController.category[index].name}",
                                style: TextStyle(color: Colors.black38),
                              )
                            ],
                          ),
                          onTap: () {
                            categoryController.setCat(id: categoryController.category[index].id, name: categoryController.category[index].name);
                            Get.to(() => CategoryProduct(
                                  category:
                                      '${categoryController.category[index].name}',
                                ));
                          },
                        ));
                  },
                )),
          )
        ],
      ),
    );
  }
}
