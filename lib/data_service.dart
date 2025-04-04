import 'package:http/http.dart' as http;
import 'post.dart';
import 'dart:convert';

class DataService {
  final _baseUrl = 'jsonPlaceholder.typicode.com';

  Future<List<Post>> getPosts() async {
    try {
      final uri = Uri.https(_baseUrl, '/posts');
      final response = await http.get(uri);
      final json = jsonDecode(response.body) as List;
      final posts = json.map((postJson) => Post.fromJson(postJson)).toList();
      return posts;
    } catch (e) {
      throw e;
    }
  }
}
