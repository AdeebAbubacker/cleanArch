import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sketch/core/model/user_model.dart';

class ApiService {
  Future<List<UseModel>> fetchUsers() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return UseModel.fromList(jsonList.cast<Map<String, dynamic>>());
    } else {
      throw Exception('Failed to load users');
    }
  }
}
