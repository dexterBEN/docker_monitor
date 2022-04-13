import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/domain/models/container.dart';
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
    notifyListeners();
  }
}
