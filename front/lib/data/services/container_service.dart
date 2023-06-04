import 'dart:io';

import 'package:front/domain/models/file.dart';
import 'package:http/http.dart' as http;

class ContainerService {
  factory ContainerService() => _containertService;

  ContainerService._();

  static final ContainerService _containertService = ContainerService._();

  static const baseUrl = 'http://127.0.0.1:5000';

  Future<String> fetchAllContainer() async {
    final response = await http.get(Uri.parse("$baseUrl/containers"));
    return response.body;
  }

  Future<http.Response> createImage(DroppedFile droppedFile) async {
    final request = http.MultipartRequest(
      "POST",
      Uri.parse("$baseUrl/container/images"),
    );

    request.files.add(
      http.MultipartFile.fromBytes(
        'dockerfile',
        droppedFile.stream,
        filename: droppedFile.name,
      ),
    );

    final responseAsStream = await request.send();
    return http.Response.fromStream(responseAsStream);
  }

  Future<int> restartContainer(String containerID) async {
    // http://127.0.0.1:5000/docker-monitor/container/restart/5a11ac781bfb

    final response = await http.post(
      Uri.parse(
        "$baseUrl/docker-monitor/container/restart/$containerID",
      ),
    );

    return response.statusCode;
  }

  //test
  Future<int> stopContainer(String containerID) async{
    final response = await http.post(
      Uri.parse(
        "$baseUrl/docker-monitor/container/stop/$containerID",
      ),
    );
    return response.statusCode;
  }

  Future<String> getContainerById(String containerID) async {

    final response = await http.get(
      Uri.parse("$baseUrl/containers/$containerID")
    );

    return response.body;
  }

  Future<String> connectToServer(String ipAdresse) async {

    final uri = Uri.parse('http://127.0.0.1:5000/servers/${ipAdresse}');

    final response = await http.get(uri);

    print("================RESPONSE================");
    print(response.body);
    print("================RESPONSE================");

    return response.body;
  }
}
