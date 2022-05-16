import 'package:dio/dio.dart';

import 'restclient.dart';

class RestRepo {
  Future<List<Task>> getTasks({required String token, required String ssid}) {
    final client = RestClient(getDioClient(token: token, ssid: ssid));
    return client.getTasks();
  }

  static Dio getDioClient({required String token, required String ssid}) {
    final Dio client = Dio();
    client.options.headers["token"] = token;
    client.options.headers["ssid"] = ssid;
    return client;
  }

  static final RestRepo INSTANCE = RestRepo._privateConstructor();

  RestRepo._privateConstructor();
}
