import 'package:equatable/equatable.dart';
import 'package:front/domain/models/docker_container.dart';

abstract class ContainerState extends Equatable{
  //List<ContainerData> ? containers = [];
  //String ? containerId;
  //ContainerData ? updatedContainer;
  //int ? newStatus;

  const ContainerState();

  @override
  List<Object> get props => [];
}

class InitialeState extends ContainerState {

  final String containerId;

  const InitialeState(this.containerId);

  @override
  List<Object> get props => [this.containerId];
}

class ListLoading extends ContainerState {
  ListLoading() : super();
}

class ListLoaded extends ContainerState {
  
  final List <ContainerData> loadedContainers;

  const ListLoaded(this.loadedContainers);

  @override
  List<Object> get props => [this.loadedContainers];
}


/**
 * Container Status
 */

// class ContainerInitialStatus extends ContainerState {

//   ContainerInitialStatus() : super(containerId: "");
// }

class ContainerStatusUpdating extends ContainerState {
  final String containerIdToUpdate;
  const ContainerStatusUpdating(this.containerIdToUpdate);

  @override
  List<Object> get props => [this.containerIdToUpdate];
}

class ContainerStatusUpdated extends ContainerState {

  //final String containerId;
  //final ContainerData updatedContainer;

  const ContainerStatusUpdated();

  @override
  List<Object> get props => [];
}

/*
* Container Fetch states
*/

class ContainerFetchState extends ContainerState{
  final ContainerData containerData;

  const ContainerFetchState(this.containerData);

  @override
  List<Object> get props => [this.containerData];
}

class ContainerFetchInitial extends ContainerState {
  const ContainerFetchInitial() : super();

  @override
  List<Object> get props => [];
}

class ContainerFetching extends ContainerState {
  const ContainerFetching();

  @override
  List<Object> get props => [];
}

class ContainerFetched extends  ContainerState{
  final ContainerData fetchedContainer;
  const ContainerFetched(this.fetchedContainer);

  @override
  List<Object> get props => [this.fetchedContainer];
}
