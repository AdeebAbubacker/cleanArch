import 'package:http/http.dart' as http;

/// Shared HTTP service used by feature data sources.
class ApiService {
  ApiService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<http.Response> get(String path) {
    final uri = Uri.parse('$_baseUrl$path');
    return _client.get(uri);
  }
}
