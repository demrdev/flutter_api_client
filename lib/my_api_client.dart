import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'base_api_client.dart';

class MyApiClient extends BaseApiClient {
  MyApiClient({required String baseUrl}) : super(baseUrl);

  Future<Map<String, dynamic>> fetchData(String endpoint) async {
    try {
      final response = await get(endpoint);
      return response.data;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

 
}
