import 'package:http/http.dart' as http;

class BackendClient {
  factory BackendClient() => _gameSheetService;

  BackendClient._();

  static final BackendClient _gameSheetService = BackendClient._();

  static const baseUrl = 'https://6115-88-170-147-136.ngrok-free.app';

  Future<String> fetchAllContainer() async {
    final response = await http.get(Uri.parse("$baseUrl/containers"));
    return response.body;
  }

  Future<http.Response> createImage(dynamic droppedFile) async {
    final request = http.MultipartRequest(
      "POST",
      Uri.parse("$baseUrl/container/images"),
    );

    // request.files.add(
    //   http.MultipartFile.fromBytes(
    //     'dockerfile',
    //     droppedFile.stream,
    //     filename: droppedFile.name,
    //   ),
    // );

    final responseAsStream = await request.send();
    return http.Response.fromStream(responseAsStream);
  }

  Future<void> restartContainer(String containerID) {
    // http://127.0.0.1:5000/docker-monitor/container/restart/5a11ac781bfb

    return http.post(
      Uri.parse(
        "$baseUrl/docker-monitor/container/restart/$containerID",
      ),
    );
  }

  //test
  Future<void> stopContainer(String containerID) {
    return http.post(
      Uri.parse(
        "$baseUrl/docker-monitor/container/stop/$containerID",
      ),
    );
  }
}
