import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/data_model.dart';

class DataServices {
  String baseURL = 'http://mark.bslmeiyu.com/api';

  Future<List<DataModel>> getInfo() async {
    var apiURL = '/getplaces';

    http.Response response = await http.get(Uri.parse(baseURL + apiURL));

    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);

        return list.map((e) => DataModel.fromJSON(e)).toList();
      }
      return <DataModel>[];
    } catch (error) {
      print(error.toString());
      return <DataModel>[];
    }
  }
}
