import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/domain/models/container.dart';
import 'package:front/domain/models/file.dart';
import 'package:front/domain/services/container.dart';

class ContainerProvider extends ChangeNotifier {
  final ContainerService _containerService = ContainerService();

  List containers = [];

  getAllContainer() {
    dynamic decodedBody;
    _containerService.fetchAllContainer().then((response) {
      decodedBody = json.decode(response.body);
      updateContainerList(decodedBody);
    });
    //print(decodedBody);
  }

  updateContainerList(List dockerContainers) {
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

  createImage(DroppedFile droppedFile) {
    _containerService.createImage(droppedFile).then((response) {
      print(json.decode(response.body));
    });
  }
}
