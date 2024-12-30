```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body) as Map<String, dynamic>; //Type checking
        // Process the data safely, checking for nulls etc.
        print(data['key']); // Access data after checking data['key'] is not null.
      } on FormatException catch (e) {
        print('Invalid JSON format: $e');
      } catch (e) {
        print('Error processing JSON: $e');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    print('Network error: $e');
  } on TimeoutException catch (e) {
    print('Timeout: $e');
  } on FormatException catch (e) {
    print('Format Exception: $e');
  } catch (e) {
    print('General Error: $e');
  }
}
```