import 'package:front/client/backend/model.dart';

class ContainerListStates {
  List<ContainerData> containers;

  ContainerListStates({required this.containers});
}

class InitialeState extends ContainerListStates {
  InitialeState() : super(containers:[]);
}
