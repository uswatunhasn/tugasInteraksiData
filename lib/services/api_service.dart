import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/todo.dart';

class ApiService {
  static const String url = 'https://jsonplaceholder.typicode.com/todos';

  static Future<List<Todo>> fetchTodos() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((item) => Todo.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
