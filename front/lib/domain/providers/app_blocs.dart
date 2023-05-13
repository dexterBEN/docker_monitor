import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/client/backend/model.dart';
import 'package:front/domain/providers/app_events.dart';
import 'package:front/domain/providers/app_states.dart';
import 'package:front/domain/services/container_service.dart';

final ContainerService _containerService = ContainerService();

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  bool isCreated = false;

  ImageBloc() : super(ImageState()) {
    on<CreateImage>((event, emit) async {
      await _containerService.createImage(event.droppedFile);
    });


  }
}