import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {

  String host;

  Api({this.host});

  predictText(String text) async {
    var parameters = {
      'message': text,
    };
    var uri = Uri(
        scheme: 'http',
        host: this.host,
        path: 'api',
        port: 5000,
        queryParameters: parameters);
    print(uri.toString());

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      return 'Failed to load';
    }
  }
}
