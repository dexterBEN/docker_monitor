import 'package:front/domain/models/docker_container.dart';

abstract class ContainerState {
  List<ContainerData> ? containers = [];

  //int ? newStatus;

  ContainerState({this.containers});
}

class InitialeState extends ContainerState {

  InitialeState() : super();
}

class ListLoading extends ContainerState {
  ListLoading() : super();
}

class ListLoaded extends ContainerState {
  
  List <ContainerData> loadedContainers;
  ListLoaded(this.loadedContainers): super(containers: loadedContainers);
}


/**
 * Container Status
 */
class ContainerStatusState {
  String ? containerId;
  ContainerData ? updatedContainer;
  ContainerStatusState({this.containerId, this.updatedContainer});
}

class ContainerInitialStatus extends ContainerStatusState {

  ContainerInitialStatus() : super(containerId: "");
}

class ContainerStatusUpdating extends ContainerStatusState {
  String ? containerId;
  ContainerStatusUpdating({this.containerId}) : super(containerId: "");
}

class ContainerStatusUpdated extends ContainerStatusState {
  ContainerStatusUpdated() : super(containerId: "", updatedContainer: null);
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
