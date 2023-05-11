import 'package:front/client/backend/model.dart';

abstract class ContainerListEvent {}

abstract class ImageEvent {}

abstract class ContainerStatusEvent {}

class FetchList extends ContainerListEvent {}

class FetchListUpdate extends ContainerListEvent {
  final ContainerData data;
  FetchListUpdate({required this.data});
}

class ContainerStart extends ContainerStatusEvent {
  final String containerId;
  ContainerStart({required this.containerId});
}

class ContainerStop extends ContainerStatusEvent {
  final String containerId;
  ContainerStop({required this.containerId});
}

class FetchContainerById extends ContainerStatusEvent {
  final String containerId;
  FetchContainerById({required this.containerId});
}
