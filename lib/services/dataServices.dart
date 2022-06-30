import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pixabay_test_application/model/dataModel.dart';

class DataServices{

  var url = 'https://pixabay.com/api/?key=28347161-ec781a5396e8847cdab72ca1f&image_type=photo&q=';
  Future<List<DataModel>?> getService(searchKey)async{
    var response = await http.get(Uri.parse('$url+$searchKey'));
    if(response.statusCode == 200){
      var datas = await jsonDecode(response.body);
      var data = datas['hits'];
      return List<DataModel>.from(data.map((e)=>DataModel.fromJson(e)));
    }
    else{
      return null;
    }
  }
}