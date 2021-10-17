import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero/models/products.dart';
import 'package:mero/pages/product-details.dart';

class GridProduct extends StatelessWidget {
  const GridProduct({Key? key, required this.product}) : super(key: key);
  final Product product;

  get index => null;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Get.to(() => ProductDetail(product));
        },
        child: Column(
          children: [
            CachedNetworkImage(
              key: UniqueKey(),
              imageUrl: '${product.image}',
              errorWidget: (context, url, error) => Icon(Icons.error),
              placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                children: [
                  Align(
                    child: Text(
                      '${product.name}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 15),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 5,),
                  Align(
                    child: Text(
                      'Rs: ${ product.price}',
                      // 'Rs: ${ product.priceFormated()}',
                      style: TextStyle(color: Colors.teal,
                          fontWeight: FontWeight.w700),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      margin: EdgeInsets.zero,
    );
  }
}
