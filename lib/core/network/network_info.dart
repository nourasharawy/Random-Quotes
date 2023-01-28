import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}


class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionchecker;
  NetworkInfoImpl ({required this.connectionchecker});
  @override
  // TODO: implement isConnected
  Future<bool> get isConnected async=> await connectionchecker.hasConnection;

}