import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://localhost:8080";

class API {
  static Future getRelatorios() {
    var url = baseUrl;
    return http.get(url);
  }
}