import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchUserProfile() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/users/1');
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch user profile');
    }
  }
 
  //payment api mock api service
   static const String _apiUrl = 'https://run.mocky.io/v3/your-mock-endpoint'; // Replace with your mock endpoint

  static Future<void> processPayment(double amount) async {
    // Create the request body
    final body = jsonEncode({
      'amount': amount,
      // You can include more fields like user details if required
    });

    // Make the HTTP POST request
    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    // Check for success
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 'success') {
        // Payment processed successfully
        return;
      } else {
        // Payment failed with a message
        throw Exception(data['message'] ?? "Payment failed!");
      }
    } else {
      // Handle HTTP error
      throw Exception("Failed to process payment. Status code: ${response.statusCode}");
    }
  }

  //Destinations
    
  final String baseUrl = 'https://api.unsplash.com/photos'; // Example endpoint
  final String accessKey = 'YOUR_ACCESS_KEY'; // Replace with your Unsplash API key

  Future<List<Map<String, dynamic>>> fetchDestinations() async {
    try {
      final response = await _dio.get(
        baseUrl,
        queryParameters: {
          'client_id': accessKey,
          'per_page': 10, // Number of results to return
        },
      );
      // Convert the response to a list of destination data
      return List<Map<String, dynamic>>.from(response.data.map((item) {
        return {
          'name': item['description'] ?? 'Beautiful Place',
          'image': item['urls']['small'], // Use the small image URL
          'rating': (item['likes'] ?? 0) / 100, // Example rating calculation
          'reviewCount': item['likes'] ?? 0,
        };
      }));
    } catch (error) {
      throw Exception('Failed to load destinations: $error');
    }
  }


  
}





