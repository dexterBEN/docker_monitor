import 'package:front/domain/models/docker_container.dart';

class ContainerListState {
  List<ContainerData> ? containers;

  int ? newStatus;

  ContainerListState({this.containers, this.newStatus});
}

class InitialeState extends ContainerListState {
  InitialeState() : super(containers: []);
}

class ListLoading extends ContainerListState {
  ListLoading() : super(containers: []);
}

class ListLoaded extends ContainerListState {
  
  ListLoaded({super.containers});
}


/**
 * Container Status
 */
class ContainerStatusState {
  String ? containerId;
  ContainerStatusState({this.containerId});
}

class ContainerInitialStatus extends ContainerStatusState {

  ContainerInitialStatus() : super(containerId: "");
}

class ContainerStatusUpdating extends ContainerStatusState {
  String ? containerId;
  ContainerStatusUpdating({this.containerId}) : super(containerId: "");
}

class ContainerStatusUpdated extends ContainerStatusState {
  String ? containerId;
  ContainerData ? updatedContainer;
  ContainerStatusUpdated({this.containerId, this.updatedContainer}) : super(containerId: "");
}

/*
* Container Fetch states
*/

class ContainerFetchState extends ContainerStatusState{
  ContainerData ? containerData;

  ContainerFetchState({this.containerData});
}

class ContainerFetchInitial extends ContainerFetchState {
  ContainerFetchInitial() : super();
}

class ContainerFetching extends ContainerFetchState {
  ContainerFetching() : super();
}

class ContainerFetched extends ContainerFetchState {
  ContainerData fetchedContainer;
  ContainerFetched({required this.fetchedContainer}) : super(containerData: null);
}
