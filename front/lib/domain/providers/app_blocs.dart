import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/client/backend/model.dart';
import 'package:front/domain/providers/app_events.dart';
import 'package:front/domain/providers/app_states.dart';
import 'package:front/domain/services/container_service.dart';

class AppBlocs extends Bloc<ContainerListEvents, ContainerListStates> {

  final ContainerService _containerService = ContainerService();
  
  AppBlocs() : super(InitialeState()) {
    on<FetchList>((event, emit) async {
      final body = await _containerService.fetchAllContainer();
      final decodedBody = json.decode(body) as Iterable;

      final List<Map<String, dynamic>> iterableToList = List.from(decodedBody);

      List<ContainerData> containers = iterableToList
        .map((containerModel) => ContainerData.fromJson(containerModel))
        .toList();

      emit(ContainerListStates(containers: containers));
    });

    on<ContainerStart>((event, emit) async {
      await _containerService.restartContainer(event.containerId);
    });
  }
}