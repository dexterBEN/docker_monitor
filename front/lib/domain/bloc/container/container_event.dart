

abstract class ContainerEvent {}
abstract class ImageEvent{}

class FetchList extends ContainerEvent{}

class ContainerStart extends ContainerEvent{
  final String containerId;
  ContainerStart({required this.containerId});
}

class ContainerStop extends ContainerEvent{
  final String containerId;
  ContainerStop({required this.containerId});
}

class FetchContainerById extends ContainerEvent{
  final String containerId;
  FetchContainerById({required this.containerId});
}

// class PersonSate wtih cnbdsbc

//  const factory PeronState.initial() = _Initial;

//  const factory PeronState.running(String continerId) = _Initial;
 

// Builder(builder/ (context) {context.watch<Controller>().state.}