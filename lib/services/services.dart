import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  final apiBaseUrl= "https://merooffer.com/api";


  Future<dynamic> getRequest(String endpoint) async{
    print(endpoint);
    var apiUrl = Uri.parse(apiBaseUrl+endpoint);
    try{
      var apiResponse = await http.get(apiUrl);

      if(apiResponse.statusCode == 200){
        var apiResponseJson = json.decode(apiResponse.body);
        return apiResponseJson;
      }
    }catch(error){
      print("\n\n error\n\n\n");
    }
  }
}