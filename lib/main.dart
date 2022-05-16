import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'rest_repo.dart';
import 'restclient.dart';

final logger = Logger();

void main() {
  runApp(const MyApp());

  // final dio = Dio(); // Provide a dio instance
  // dio.options.headers["Demo-Header"] =
  //     "demo header"; // config your dio headers globally
  // final client = RestClient();
  RestRepo.INSTANCE
      .getTasks(token: 'dummy token', ssid: 'ssid')
      .then((it) => it.forEach((e) {
            debugPrint(e.id);
          }))
      .catchError((Object obj) {
    switch (obj.runtimeType) {
      case DioError:
        final res = (obj as DioError).response;
        debugPrint("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
        break;
      default:
        break;
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Text(
        "Hello World",
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
