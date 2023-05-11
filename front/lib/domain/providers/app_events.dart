import 'package:flutter/material.dart';
import 'package:front/domain/models/file.dart';

// abstract class ContainerEvent {}
abstract class ImageEvent{}

// class FetchList extends ContainerEvent{}

// class ContainerStart extends ContainerEvent{
//   final String containerId;
//   ContainerStart({required this.containerId});
// }

// class ContainerStop extends ContainerEvent{
//   final String containerId;
//   ContainerStop({required this.containerId});
// }

class CreateImage extends ImageEvent {
  final DroppedFile droppedFile;
  final VoidCallback onImageCreated;
  CreateImage({required this.droppedFile, required this.onImageCreated});
}
