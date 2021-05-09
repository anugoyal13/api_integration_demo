import 'dart:convert';

import 'package:api_imtegration_demo/model/factResponse.dart';
import 'package:http/http.dart' as http;


class DataServices{
  Future<FactResponse>getData()async{
    http.Response response;
    response=await http.get(Uri.parse("https://thegrowingdeveloper.org/apiview?id=2"));
    if(response.statusCode==200){
     // print(response.statusCode);
      FactResponse factResponse=FactResponse.fromJson(json.decode(response.body));
      return factResponse;


    }
    else{
      return null;
    }
  }
}