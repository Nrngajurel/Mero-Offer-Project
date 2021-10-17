import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mero/controllers/city-controller.dart';

class LocationFilter extends StatefulWidget {
  const LocationFilter({Key? key}) : super(key: key);

  @override
  _LocationFilterState createState() => _LocationFilterState();
}

class _LocationFilterState extends State<LocationFilter> {
  // final cityController = Get.put(CityController());

  final CityController cityController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Pick A Location", style: TextStyle(color: Colors.teal),),
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
          child: Obx(()=>ListView.builder(
              itemCount: cityController.cities.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('${cityController.cities[index].name}'),
                  onTap: (){

                    cityController.setCity(id: cityController.cities[index].id, name: cityController.cities[index].name);
                    Get.back();
                  },
                );

              })),
        ));
  }
}
