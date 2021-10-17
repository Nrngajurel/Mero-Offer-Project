import 'dart:convert';

import 'package:get/get.dart';
import 'package:mero/controllers/product-controller.dart';
import 'package:mero/models/city.dart';
import 'package:mero/services/services.dart';

class CityController extends GetxController {
  final RxList<City> cities = <City>[].obs;
  RxString city = "Location".obs;

  @override
  void onReady() {
    super.onReady();
    fetchCities();
  }

  Future<void> fetchCities() async {
    final List<City> loadCity = <City>[];

    final response = await ApiServices().getRequest("/city");

    response['data']['data'].forEach((json) {
      loadCity.add(City(
        id: json["id"],
        name: json["name"],
        order: json["order"],
        slug: json["slug"],
        status: json["status"],
        parentId: json["parent_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      ));
    });
    cities.assignAll(loadCity);
  }

  void setCity({required int id,required name}){
    final ProductController productController = Get.find();
    this.city.value = name;
    productController.setAttribute(city_id: id);
  }
}
