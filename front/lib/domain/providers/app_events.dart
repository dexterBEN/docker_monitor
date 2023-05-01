abstract class ContainerListEvents {}

class FetchList extends ContainerListEvents{}

class ContainerStart extends ContainerListEvents{
  final String containerId;
  ContainerStart({required this.containerId});
}

class ContainerStop extends ContainerListEvents{}
