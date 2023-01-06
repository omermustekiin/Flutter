import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/data_model.dart';

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";

  ///getting data from server
  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));

    try {
      ///controling the have data. http package ıf get data from sever return the 200, 200 mean its correct
      if (res.statusCode == 200) {
        ///decoding data and calling my converter factory function
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        print(
            "nothing any data or problem with converter. DataModel returned null");
        return <DataModel>[];
      }
    } catch (e) {
      print("http cant get data from server: $e \n DataModel returned null");
      return <DataModel>[];
    }
  }
}
