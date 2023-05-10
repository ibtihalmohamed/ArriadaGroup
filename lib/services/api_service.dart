import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../helpers/constants.dart';

class Api {
  get(String url, Map body) async {
    var response = await http.get(Uri.parse(baseUrl + url));
    if (kDebugMode) {
      print("get on: $baseUrl$url /n with body: $body");
      print("Status code: ${response.statusCode} response:${response.body}");
    }
    return response;
  }

  Future<http.Response> post(String url, Map body) async {
    var response = await http.get(
      Uri.parse(baseUrl + url),
    );
    if (kDebugMode) {
      print("post on: $baseUrl$url /n with body: $body");
      print("Status code: ${response.statusCode} response:${response.body}");
    }
    return response;
  }

  put(String url, Map body) async {
    var response = await http.put(Uri.parse(baseUrl + url), body: body);
    if (kDebugMode) {
      print("put on: $baseUrl$url /n with body: $body");
      print("Status code: ${response.statusCode} response:${response.body}");
    }
    return response;
  }

  delete(String url, Map body) async {
    var response = await http.delete(Uri.parse(baseUrl + url), body: body);
    if (kDebugMode) {
      print("delete on: $baseUrl$url /n with body: $body");
      print("Status code: ${response.statusCode} response:${response.body}");
    }
    return response;
  }
}
