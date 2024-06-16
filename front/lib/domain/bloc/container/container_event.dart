import 'package:equatable/equatable.dart';

abstract class ContainerEvent extends Equatable{
  const ContainerEvent();

  @override
  List<Object> get props => [];
}

class FetchList extends ContainerEvent{}

class ContainerStart extends ContainerEvent{
  final String containerId;
  const ContainerStart({required this.containerId});

  @override
  List<Object> get props => [containerId];
}

class ContainerStop extends ContainerEvent{
  final String containerId;
  const ContainerStop({required this.containerId});

  @override
  List<Object> get props => [containerId];
}

class FetchContainerById extends ContainerEvent{
  final String containerId;
  const FetchContainerById({required this.containerId});

  @override
  List<Object> get props => [containerId];
}

abstract class ImageEvent{}
// class PersonSate wtih cnbdsbc

//  const factory PeronState.initial() = _Initial;

//  const factory PeronState.running(String continerId) = _Initial;
 

// Builder(builder/ (context) {context.watch<Controller>().state.}