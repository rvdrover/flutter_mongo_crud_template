import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;

class CrudProvider extends ChangeNotifier {
  final client = http.Client();
  List<dynamic> crudData = <dynamic>[];

  Future fetchData() async {
    final Uri url = Uri.parse('https://fluttermongocrud.herokuapp.com/');
    var response = await client.get(url);
    final Map parsedData = await jsonDecode(response.body.toString());
    crudData = parsedData['data'];
  }

  Future addData(Map<String, String> body) async {
    final Uri url = Uri.parse('https://fluttermongocrud.herokuapp.com/add');
    var response = await client.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body));
    return response.body;
  }

  Future deleteData(String id) async {
    print(id+"second");
    final Uri url = Uri.parse('https://fluttermongocrud.herokuapp.com/delete');
    var response = await client.delete(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"_id": id}));
    print(response.body);
    return response.body;
  }

  Future updateData(Map<String, String> data) async {
    final Uri url = Uri.parse('https://fluttermongocrud.herokuapp.com/update');
    var response = await client.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    print(response.body);
    return response.body;
  }
}
