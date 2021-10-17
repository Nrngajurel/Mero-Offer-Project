import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero/controllers/category-controller.dart';
import 'package:mero/controllers/city-controller.dart';
import 'package:mero/pages/locationcatfilter/category.dart';
import 'package:mero/pages/locationcatfilter/location.dart';

class LocationCatFilterRow extends StatefulWidget {
  const LocationCatFilterRow({
    Key? key,
  }) : super(key: key);

  @override
  _LocationCatFilterRowState createState() => _LocationCatFilterRowState();
}

class _LocationCatFilterRowState extends State<LocationCatFilterRow> {

  final categoryController = Get.put(CategoryController());
  final cityController = Get.put(CityController());

  // final CategoryController categoryController = Get.find();
  // final CityController cityController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.to(() => LocationFilter());
            },
            child: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.teal,
                  ),
                  Obx(()=> Text(
                    "${cityController.city.value}",
                    style: TextStyle(color: Colors.teal),
                  ))
                ],
              ),
              // padding: const EdgeInsets.symmetric(horizontal: ),
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                color: Colors.teal,
              ))),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => CategoryFilter());
            },
            child: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.sell,
                    color: Colors.teal,
                  ),
                  Obx(()=>Text(
                    "${categoryController.cat.value}",
                    style: TextStyle(color: Colors.teal),
                  ))
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.42,
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                        color: Colors.teal,
                      ))),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.1,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Icon(
                  Icons.filter_alt,
                  color: Colors.teal,
                ),
              ],
            ),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 5),
          ],
          border: Border(bottom: BorderSide(width: 0.1, color: Colors.teal))),
    );
  }
}
