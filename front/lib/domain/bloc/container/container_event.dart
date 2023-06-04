

abstract class ContainerListEvent {}
abstract class ImageEvent{}
abstract class ContainerStatusEvent {
  
}

class FetchList extends ContainerListEvent{}

class ContainerStart extends ContainerStatusEvent{
  final String containerId;
  ContainerStart({required this.containerId});
}

class ContainerStop extends ContainerStatusEvent{
  final String containerId;
  ContainerStop({required this.containerId});
}

class FetchContainerById extends ContainerStatusEvent{
  final String containerId;
  FetchContainerById({required this.containerId});
}

// class PersonSate wtih cnbdsbc

//  const factory PeronState.initial() = _Initial;

//  const factory PeronState.running(String continerId) = _Initial;
 

// Builder(builder/ (context) {context.watch<Controller>().state.}