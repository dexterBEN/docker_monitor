import 'dart:convert';

import 'package:http/http.dart' as http;

class ContainerService {
  static final ContainerService _gameSheetService =
      ContainerService._internal();

  factory ContainerService() => _gameSheetService;

  ContainerService._internal();

  Future fetchAllContainer() async {
    final response =
        await http.get(Uri.parse("http://127.0.0.1:5000/containers"));

    return response;
  }
}
