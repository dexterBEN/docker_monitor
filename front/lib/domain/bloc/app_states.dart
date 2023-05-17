import 'package:flutter/material.dart';

// class ContainerListState {
//   List<ContainerData> containers;

//   ContainerListState({required this.containers});
// }

// class InitialeState extends ContainerListState {
//   InitialeState() : super(containers:[]);
// }

// class ListLoading extends ContainerListState {
//   ListLoading() : super(containers:[]);
// }

// class ListLoaded extends ContainerListState {
//   ListLoaded({required super.containers});
// }

/*
  Image creation 
*/
class ImageState {
}

class ImageCreationInitial extends ImageState {
  ImageCreationInitial();
  
}

class ImageCreationLoading extends ImageState {
  ImageCreationLoading();

}

class ImageCreationSuccess extends ImageState{
  ImageCreationSuccess();

}

class ImageCreationFailed extends ImageState{
  ImageCreationFailed();
}
