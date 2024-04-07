import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/domain/models/docker_container.dart';
import 'package:front/domain/bloc/container/container_event.dart';
import 'package:front/domain/bloc/container/container_state.dart';
import 'package:front/data/services/container_service.dart';

final ContainerService _containerService = ContainerService();

class ContainerBloc extends Bloc<ContainerEvent, ContainerState> {
  ContainerBloc() : super(InitialeState()) {

    on<FetchList>((event, emit) async {
      emit(ListLoading());
      final body = await _containerService.fetchAllContainer();
      final decodedBody = json.decode(body) as Iterable;

      final List<Map<String, dynamic>> iterableToList = List.from(decodedBody);

      List<ContainerData> containers = iterableToList
          .map((containerModel) => ContainerData.fromJson(containerModel))
          .toList();

      emit(ListLoaded(containers));
    });


    // on<FetchContainerById>((event, emit) async {
    //   final body = await _containerService.getContainerById(event.containerId);

    //   ContainerData dockerContainer = json.decode(body) as ContainerData;
    //   print(dockerContainer);
    //   //emit(ContainerStatusUpdated(newStatus: ))
    // });
  }
}

class ContainerStatusBloc extends Bloc<ContainerEvent, ContainerState> {

  ContainerStatusBloc() : super(InitialeState()){

    on<ContainerStart>((event, emit) async {
      emit(ContainerStatusUpdating(containerIdToUpdate: event.containerId));
      var actionStatus =
          await _containerService.restartContainer(event.containerId);

      //print(actionStatus);

      if(actionStatus == 200) {
        add(FetchContainerById(containerId: event.containerId));
        emit(ContainerStatusUpdated());
      }
    });

    on<ContainerStop>((event, emit) async {
      emit(ContainerStatusUpdating(containerIdToUpdate: event.containerId));
      final actionStatus =  await _containerService.stopContainer(event.containerId);

      if(actionStatus == 200) {
        add(FetchContainerById(containerId: event.containerId));
        emit(ContainerStatusUpdated());
      }
    });

    on<FetchContainerById>((event, emit) async {
      emit(ContainerFetching());

      final body = await _containerService.getContainerById(event.containerId);

      final Map<String, dynamic> decodedJson = json.decode(body) as Map<String, dynamic>;
      //print(decodedJson.runtimeType);
      final ContainerData containerData = ContainerData.fromJson(decodedJson);
      //print(containerData);

      //print(dockerContainer);
      emit(ContainerFetched(fetchedContainer: containerData));
    });
  }
}


