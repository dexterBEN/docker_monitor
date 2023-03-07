// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContainerData _$ContainerDataFromJson(Map<String, dynamic> json) =>
    ContainerData(
      id: json['Id'] as String,
      config: Config.fromJson(json['Config'] as Map<String, dynamic>),
      name: json['Name'] as String,
      state: ContainerState.fromJson(json['State'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['Created'] as String),
    );

Map<String, dynamic> _$ContainerDataToJson(ContainerData instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Config': instance.config,
      'Name': instance.name,
      'State': instance.state,
      'Created': instance.createdAt.toIso8601String(),
    };

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      cmd: (json['Cmd'] as List<dynamic>?)?.map((e) => e as String).toList(),
      entrypoint: (json['Entrypoint'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      envs: (json['Env'] as List<dynamic>?)?.map((e) => e as String).toList(),
      image: json['Image'] as String,
      workDir: json['WorkingDir'] as String,
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'Cmd': instance.cmd,
      'Entrypoint': instance.entrypoint,
      'Env': instance.envs,
      'Image': instance.image,
      'WorkingDir': instance.workDir,
    };

ContainerState _$ContainerStateFromJson(Map<String, dynamic> json) =>
    ContainerState(
      status: $enumDecode(_$ContainerStatusEnumMap, json['Status']),
    );

Map<String, dynamic> _$ContainerStateToJson(ContainerState instance) =>
    <String, dynamic>{
      'Status': _$ContainerStatusEnumMap[instance.status]!,
    };

const _$ContainerStatusEnumMap = {
  ContainerStatus.created: 'created',
  ContainerStatus.restarting: 'restarting',
  ContainerStatus.running: 'running',
  ContainerStatus.removing: 'removing',
  ContainerStatus.paused: 'paused',
  ContainerStatus.exited: 'exited',
  ContainerStatus.dead: 'dead',
};
