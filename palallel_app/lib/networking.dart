import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  static final String _apiKey = "d969840de2fd4ed2b0d5468bac739391";
  static final String _baseURL = "https://newsapi.org/v2/top-headlines?";



   static Future<dynamic> getApi(var countryCode) async {


    http.Response response = await http.get(_baseURL + 'country=$countryCode&apiKey=' + _apiKey);

    return jsonDecode(response.body);

  }

  Future<List> getApiConcurrent() async
  {

    var result_1 = await compute(getApi,'us');
    var result_2 = await compute(getApi,'eg');
    var result_3 = await compute(getApi,'sa');
    var result_4 = await compute(getApi,'de');
    var result_5 = await compute(getApi,'ar');

    return [ result_1 , result_2 , result_3 , result_4 , result_5];

  }

}
