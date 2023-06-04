abstract class ServerEvent {}
abstract class ServerList {}

class ServerConnectInitial extends ServerEvent {
  
}

class ServerConnect extends ServerEvent {
  final String ipAdress;
  ServerConnect({required this.ipAdress});
}
