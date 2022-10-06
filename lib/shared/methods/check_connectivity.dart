import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> checkConnectivity() async {
  InternetConnectionChecker connectionChecker = InternetConnectionChecker();
  return await connectionChecker.hasConnection;
}
