import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:task1/model/store.dart';
import 'package:task1/model/store_category.dart';
import 'package:task1/model/user.dart';

class Api {
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization':
        'Bearer \$2y\$10\$J1quOsaM9A4GOOBJ94.JoupJkdAcKS3tyeDwo.qRYkJ2D0Ev4iCuW',
    'x-api-key': '7610ed17b516d04629f55a715dca9c64104d00d9'
  };

  final String _host = "https://qa-test-task.nestmart.co";

  Future<List<Store>> getTopBrands() async {
    String endpoint = "/api/v1/storelist/en";
    List<Store> stores = [];
    try {
      final response =
          await http.get(Uri.parse(_host + endpoint), headers: _headers);

      if (response.statusCode == 200) {
        Map mapData = await jsonDecode(response.body);
        for (Map<String, dynamic> store in mapData['data']['stores']) {
          stores.add(Store.fromJson(store));
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    return stores;
  }

  Future<User> getUserInfo(int id) async {
    // int id = 7;
    String endpoint = "/api/v1/userinfo/$id";
    User user = User(
      0,
      name: "User",
    );
    try {
      final response =
          await http.get(Uri.parse(_host + endpoint), headers: _headers);

      if (kDebugMode) {}
      if (response.statusCode == 200) {
        Map<String, dynamic> decoded = await jsonDecode(response.body);

        user = User.fromJson(decoded['data']['user'][0]);
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    return user;
  }

  Future<List<StoreCategory>> getTopCategory() async {
    String endpoint = "/api/v1/gettopcategories/en";
    List<StoreCategory> categories = [];
    try {
      final response =
          await http.get(Uri.parse(_host + endpoint), headers: _headers);

      if (response.statusCode == 200) {
        Map mapData = await jsonDecode(response.body);
        for (Map<String, dynamic> category in mapData['data']['categories']) {
          categories.add(StoreCategory.fromJson(category));
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    return categories;
  }
}


/*

TOP BRANDS:
https://qa-test-task.nestmart.co/api/v1/storelist/en

GET /api/v1/storelist/en HTTP/1.1
Authorization: Bearer $2y$10$J1quOsaM9A4GOOBJ94.JoupJkdAcKS3tyeDwo.qRYkJ2D0Ev4iCuW
Host: qa-test-task.nestmart.co
x-api-key: 7610ed17b516d04629f55a715dca9c64104d00d9


User Info:

GET /api/v1/userinfo/7 HTTP/1.1
Authorization: Bearer $2y$10$J1quOsaM9A4GOOBJ94.JoupJkdAcKS3tyeDwo.qRYkJ2D0Ev4iCuW
Host: qa-test-task.nestmart.co
x-api-key: 7610ed17b516d04629f55a715dca9c64104d00d9


Category:

GET /api/v1/gettopcategories/en HTTP/1.1
Authorization: Bearer $2y$10$J1quOsaM9A4GOOBJ94.JoupJkdAcKS3tyeDwo.qRYkJ2D0Ev4iCuW
Host: qa-test-task.nestmart.co
x-api-key: 7610ed17b516d04629f55a715dca9c64104d00d9




*/