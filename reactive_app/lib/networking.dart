import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  static final String _apiKey = "d969840de2fd4ed2b0d5468bac739391";
  static final String _baseURL = "https://newsapi.org/v2/top-headlines?";

  Future getApi() async {

    http.Response response_1 =
        await http.get(_baseURL + 'country=us&apiKey=' + _apiKey);

    http.Response response_2 =
        await http.get(_baseURL + 'country=eg&apiKey=' + _apiKey);
    http.Response response_3 =
        await http.get(_baseURL + 'country=sa&apiKey=' + _apiKey);
    http.Response response_4 =
        await http.get(_baseURL + 'country=de&apiKey=' + _apiKey);
    http.Response response_5 =
        await http.get(_baseURL + 'country=ar&apiKey=' + _apiKey);

    List responsesList = [
      jsonDecode(response_1.body),
      jsonDecode(response_2.body),
      jsonDecode(response_3.body),
      jsonDecode(response_4.body),
      jsonDecode(response_5.body)
    ];


    return responsesList;
  }
}
