import 'package:front/domain/models/docker_container.dart';

abstract class ContainerState {
  List<ContainerData> ? containers = [];
  String ? containerId;
  ContainerData ? updatedContainer;
  //int ? newStatus;

  ContainerState({this.containers, this.containerId, this.updatedContainer});
}

class InitialeState extends ContainerState {

  InitialeState() : super(containerId: "");
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

// class ContainerInitialStatus extends ContainerState {

//   ContainerInitialStatus() : super(containerId: "");
// }

class ContainerStatusUpdating extends ContainerState {
  String ? containerIdToUpdate;
  ContainerStatusUpdating({this.containerIdToUpdate}) : super(containerId: containerIdToUpdate);
}

class ContainerStatusUpdated extends ContainerState {
  ContainerStatusUpdated() : super(containerId: "", updatedContainer: null);
}

/*
* Container Fetch states
*/

class ContainerFetchState extends ContainerState{
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
