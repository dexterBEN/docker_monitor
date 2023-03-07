// To parse this JSON data, do
//
//     final container = containerFromJson(jsonString);

// import 'dart:convert';

// DockerContainer containerFromJson(String str) =>
//     DockerContainer.fromJson(json.decode(str));

// String containerToJson(DockerContainer data) => json.encode(data.toJson());

class Container {
  const Container({
    required this.id,
    required this.image,
    required this.name,
    required this.status,
    required this.createdAt,
  });

  // TODO: factory Container.fromBackend(Container c) => Container();

  final String id;
  final String name;
  final String image;
  final ContainerStatus status;
  final DateTime createdAt;
}

enum ContainerStatus {
  created,
  restarting,
  running,
  removing,
  paused,
  exited,
  dead;
}
