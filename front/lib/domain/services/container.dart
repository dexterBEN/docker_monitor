import 'dart:io';

import 'package:front/domain/models/file.dart';
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

  Future createImage(DroppedFile droppedFile) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("http://127.0.0.1:5000/container/images"),
    );

    request.files.add(
      http.MultipartFile.fromBytes(
        'dockerfile',
        droppedFile.stream,
        filename: droppedFile.name,
      ),
    );
    var responseAsStream = await request.send();

    var response = await http.Response.fromStream(responseAsStream);
    return response;
  }

  void restartContainer(String containerID) async {
    // http://127.0.0.1:5000/docker-monitor/container/restart/5a11ac781bfb
    final response = await http.post(
      Uri.parse(
        "http://127.0.0.1:5000/docker-monitor/container/restart/${containerID}",
      ),
    );
  }
}
