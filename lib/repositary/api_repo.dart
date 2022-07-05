

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pagination_flutter/model/passenger_api.dart';

class ApiRepo{

  static int currentPage = 10;

  static Future<PassengerModel?> getData ({bool fromInit = true}) async {


    if(fromInit == true){
      currentPage = 20;
    }else{
      currentPage+= 20;
    }
    print(currentPage);

   var url =  "https://api.instantwebtools.net/v1/passenger?page=0&size=$currentPage";



   var response = await http.get(Uri.parse(url));

   if(response.statusCode == 200){

     debugPrint(response.statusCode.toString());
     debugPrint(response.body);

    // var jsonData = json.decode(response.body);


    // PassengerModel model = PassengerModel.fromJson(jsonData);


     var model = PassengerModelFromJson(response.body);
     
     
     print('==============> length ${model.data.length}' );






     return model;



     // var list = jsonData['data'];
     // List <Data> passengerList = [];
     // for(var map in list){
     //
     //   Data data = Data.fromJson(map);
     //
     //   passengerList.add(data);
     //
     // }
     // return passengerList;



   }else{
     print(response.statusCode);
     return null;

   }
  }
}