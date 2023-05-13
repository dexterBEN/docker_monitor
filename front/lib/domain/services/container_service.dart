import 'package:front/client/backend/model.dart';
import 'package:front/domain/models/file.dart';
import 'package:http/http.dart' as http;

class ContainerService {
  factory ContainerService() => _containertService;

  ContainerService._();

  static final ContainerService _containertService = ContainerService._();

  static const baseUrl = 'https://6115-88-170-147-136.ngrok-free.app';

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
  Future<void> stopContainer(String containerID) {
    return http.post(
      Uri.parse(
        "$baseUrl/docker-monitor/container/stop/$containerID",
      ),
    );
  }

  Future<String> getContainerById(String containerID) async {

    final response = await http.get(
      Uri.parse("$baseUrl/containers/$containerID")
    );

    return response.body;
  }
}
