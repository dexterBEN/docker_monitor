import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/data/services/container_service.dart';
import 'package:front/domain/bloc/server/server_event.dart';
import 'package:front/domain/bloc/server/server_state.dart';

final ContainerService _containerService = ContainerService();

class ServerBloc extends Bloc<ServerEvent, ServerState> {

  ServerBloc() : super(ServerStateInitial()) {

    on<ServerConnect>((event, emit) async {

      emit(ServerStarting());

      final response = await _containerService.connectToServer(event.ipAdress);

      print(response);

      if(response.contains("tcp")) {
        emit(ServerStarted());
        print("<====STARTED====>");
      }
    });
  }
}