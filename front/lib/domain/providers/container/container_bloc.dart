import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/client/backend/model.dart';
import 'package:front/domain/providers/container/container_event.dart';
import 'package:front/domain/providers/container/container_state.dart';
import 'package:front/domain/services/container_service.dart';

final ContainerService _containerService = ContainerService();

class ContainerListBloc extends Bloc<ContainerListEvent, ContainerListState> {
  ContainerListBloc() : super(InitialeState()) {
    on<FetchList>((event, emit) async {
      final body = await _containerService.fetchAllContainer();
      final decodedBody = json.decode(body) as Iterable;

      final List<Map<String, dynamic>> iterableToList = List.from(decodedBody);

      List<ContainerData> containers = iterableToList
          .map((containerModel) => ContainerData.fromJson(containerModel))
          .toList();

      emit(ListLoaded(containers: containers));
    });


    // on<FetchContainerById>((event, emit) async {
    //   final body = await _containerService.getContainerById(event.containerId);

    //   ContainerData dockerContainer = json.decode(body) as ContainerData;
    //   print(dockerContainer);
    //   //emit(ContainerStatusUpdated(newStatus: ))
    // });
  }
}

class ContainerStatusBloc extends Bloc<ContainerStatusEvent, ContainerStatusState> {

  ContainerStatusBloc() : super(ContainerInitialStatus()){

    on<ContainerStart>((event, emit) async {
      emit(ContainerStatusUpdating(containerId: event.containerId));
      var actionStatus =
          await _containerService.restartContainer(event.containerId);

      //print(actionStatus);

      if(actionStatus == 200) {
        add(FetchContainerById(containerId: event.containerId));
      }
    });

    on<ContainerStop>((event, emit) async {
      await _containerService.stopContainer(event.containerId);
    });

    on<FetchContainerById>((event, emit) async {
      final body = await _containerService.getContainerById(event.containerId);

      final Map<String, dynamic> decodedJson = json.decode(body) as Map<String, dynamic>;
      print(decodedJson.runtimeType);
      ContainerData containerData = ContainerData.fromJson(decodedJson);
      print(containerData);

      //print(dockerContainer);
      emit(ContainerFetched(fetchedContainer: containerData));
    });
  }
}


