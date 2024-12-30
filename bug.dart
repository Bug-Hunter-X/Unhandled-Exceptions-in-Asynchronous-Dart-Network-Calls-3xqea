```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Properly handle JSON decoding here.  The error is often in this step.
      final data = jsonDecode(response.body);
      // Process the data
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Here's where things get tricky.  'e' might not always be what you expect.
    // It could be a SocketException, TimeoutException, FormatException, or something else entirely. 
    print('Error: $e'); // Log the error for debugging.
    rethrow; // Re-throw the exception to be handled higher up.
  }
}
```