import 'package:json_annotation/json_annotation.dart';

part 'docker_container.g.dart';

@JsonSerializable(includeIfNull: true)
class ContainerData {
  const ContainerData({
    required this.id,
    required this.config,
    required this.name,
    required this.state,
    required this.createdAt,
  });

  factory ContainerData.fromJson(Map<String, dynamic> json) =>
      _$ContainerDataFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerDataToJson(this);

  @JsonKey(name: 'Id')
  final String id;

  @JsonKey(name: 'Config')
  final Config config;

  @JsonKey(name: "Name")
  final String name;

  @JsonKey(name: "State")
  final ContainerState state;

  @JsonKey(name: "Created")
  final DateTime createdAt;
}

@JsonSerializable(includeIfNull: true)
class Config {
  const Config({
    required this.cmd,
    required this.entrypoint,
    required this.envs,
    required this.image,
    required this.workDir,
  });

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  @JsonKey(name: 'Cmd')
  final List<String>? cmd;

  @JsonKey(name: 'Entrypoint')
  final List<String>? entrypoint;

  @JsonKey(name: 'Env')
  final List<String>? envs;

  @JsonKey(name: 'Image')
  final String image;

  @JsonKey(name: 'WorkingDir')
  final String workDir;
}

@JsonSerializable(includeIfNull: true)
class ContainerState {
  const ContainerState({
    required this.status,
  });

  factory ContainerState.fromJson(Map<String, dynamic> json) =>
      _$ContainerStateFromJson(json);

  @JsonKey(name: 'Status')
  final ContainerStatus status;
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
