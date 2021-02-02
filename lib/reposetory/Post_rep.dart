import 'package:api_and_bloc_flutter/Models/Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Post_rep {

  Future<List<Model>> fetchPosts() async {

    List<Model> list = [];

    var respons = await http.get('https://jsonplaceholder.typicode.com/posts');

    if (respons.statusCode == 200) {
      var jso = json.decode(respons.body);

      jso.map((data) => list.add(Model.fromJson(data))).toList();

      return list;
    }
  }
}
