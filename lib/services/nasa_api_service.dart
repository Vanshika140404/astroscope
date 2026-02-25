import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/apod_model.dart';

class NasaApiService {

  Future<List<Apod>> fetchApod({int count = 5}) async {

    final apiKey = dotenv.env['NASA_API_KEY'];

    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('NASA API key not found in environment variables');
    }

    final Uri uri = Uri.https(
      'api.nasa.gov',
      '/planetary/apod',
      {
        'api_key': apiKey,
        'count': count.toString(),
      },
    );

    final response = await http.get(uri)
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      return jsonList
          .map((json) => Apod.fromJson(json))
          .toList();
    } else {
      throw Exception(
        'Failed to load APOD data (${response.statusCode})',
      );
    }
  }
}
