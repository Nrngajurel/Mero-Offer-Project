import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mero/controllers/product-controller.dart';

import 'gridproduct.dart';


class GridProducts extends StatefulWidget {
  const GridProducts({Key? key}) : super(key: key);

  @override
  _GridProductsState createState() => _GridProductsState();
}

class _GridProductsState extends State<GridProducts> {
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: Obx((){
            if(productController.loading.value){
              return Center(child: CircularProgressIndicator(),);
            }
            return StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                itemCount: productController.productData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,

                      child: GridProduct(product: productController.productData[index],),
                    ),
                  );
                },
                staggeredTileBuilder: (int index) =>
                new StaggeredTile.fit(1)
            );
          })
      ),
    );
  }
}
