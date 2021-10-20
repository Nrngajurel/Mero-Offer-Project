import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero/controllers/product-controller.dart';
import 'package:mero/models/products.dart';
import 'package:mero/pages/product-details.dart';

class ListProducts extends StatefulWidget {
  const ListProducts({Key? key}) : super(key: key);

  @override
  _ListProductsState createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  // final ProductController productController = Get.find();
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Obx(() {
          if (productController.loading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: productController.productData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListProduct(
                  product: productController.productData[index],
                );
              });
        }),
      ),
    );
  }
}

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
      onTap: () {
        Get.to(() => ProductDetail(widget.product));
      },
      child: Card(
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  child: CachedNetworkImage(
                    imageUrl: '${widget.product.image}',
                    key: UniqueKey(),
                    width: 120,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )),
            Container(
              child: Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '${widget.product.name}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 15),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                      'Rs: ${ widget.product.price}',
                      // 'Rs: ${ product.priceFormated()}',
                      style: TextStyle(color: Colors.teal,
                          fontWeight: FontWeight.w700),
                    ),)


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
