import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/domain/models/file.dart';
import 'package:front/domain/services/container_service.dart';
import 'package:front/client/backend/model.dart';

class ContainerProvider extends ChangeNotifier {
  final ContainerService _containerService = ContainerService();

  List<ContainerData> containers = [];

  Future<void> getAllContainer() async {
    final body = await _containerService.fetchAllContainer();
    final decodedBody = json.decode(body) as Iterable;

    final List<Map<String, dynamic>> iterableToList = List.from(decodedBody);

    containers = iterableToList
        .map((containerModel) => ContainerData.fromJson(containerModel))
        .toList();
    updateContainerList(containers);

    //print(decodedBody);
  }

  void updateContainerList(List<ContainerData> dockerContainers) {
    containers = dockerContainers;
    // dockerContainers.map((container) {
    //   containers.add(DockerContainer.fromJson(container));
    // });

    // DockerContainer container = DockerContainer.fromJson(dockerContainers[4]);
    // print("==================");
    // print(container);
    // print("==================");
    notifyListeners();
  }

  Future<void> createImage(DroppedFile droppedFile) {
    return _containerService.createImage(droppedFile);
  }

  Future<void> restartContainer(String containerID) async {
    await _containerService.restartContainer(containerID);
    await getAllContainer();
  }

  Future<void> stopContainer(String containerID) async {
    await _containerService.stopContainer(containerID);
    await getAllContainer();
  }
}
