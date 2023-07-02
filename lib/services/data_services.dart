import 'dart:convert';

import 'package:cubit_app/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseUrl = 'https://us-central1-my-api-endpoint.cloudfunctions.net';
  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getTourData';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
