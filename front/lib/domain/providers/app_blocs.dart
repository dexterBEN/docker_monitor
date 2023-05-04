import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/client/backend/model.dart';
import 'package:front/domain/providers/app_events.dart';
import 'package:front/domain/providers/app_states.dart';
import 'package:front/domain/services/container_service.dart';

final ContainerService _containerService = ContainerService();
class ContainerBloc extends Bloc<ContainerEvent, ContainerListState> {

  ContainerBloc() : super(InitialeState()) {

    on<FetchList>((event, emit) async {
      final body = await _containerService.fetchAllContainer();
      final decodedBody = json.decode(body) as Iterable;

      final List<Map<String, dynamic>> iterableToList = List.from(decodedBody);

      List<ContainerData> containers = iterableToList
        .map((containerModel) => ContainerData.fromJson(containerModel))
        .toList();

      emit(ListLoaded(containers: containers));
    });

    on<ContainerStart>((event, emit) async {
      await _containerService.restartContainer(event.containerId);
    });

    on<ContainerStop>((event, emit) async {
      await _containerService.stopContainer(event.containerId);
    });
  }
}

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  bool isCreated = false;

  ImageBloc() : super(ImageState()) {
    on<CreateImage>((event, emit) async {
      await _containerService.createImage(event.droppedFile);
    });


  }
}