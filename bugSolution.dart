```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process jsonData and potentially return results
      return jsonData; // return data for further processing
    } else {
      // Handle HTTP errors more specifically
      throw HttpException('HTTP error! Status code: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    // Handle network errors specifically
    print('Network error: $e');
    throw NetworkException('Network error: Could not connect to the server.');
  } on FormatException catch (e) {
    // Handle JSON decoding errors
    print('JSON format error: $e');
    throw DataFormatException('Invalid JSON data received.');
  } catch (e) {
    // Handle other unexpected exceptions
    print('Unexpected error: $e');
    rethrow; 
  }
}
```