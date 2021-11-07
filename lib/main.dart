



import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_first_project/core/RedScreen.dart';


import 'package:flutter/material.dart';



main() async {
  FirebaseMessaging.onBackgroundMessage((message) => null)
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  GlobalKey _key = GlobalKey<ScaffoldState>();





  @override
  void initState() {
    super.initState();

  configureMessage();

    
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: {
        RedScreen.id: (context) => RedScreen(),
      },
      home: Scaffold(
        key: _key,
          body: Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(_key.currentContext!).pushNamed(RedScreen.id),
                child: Text("Click me"),
              ),
          ),
      ),
    );
  }

  void configureMessage() {
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((event) {
      print(event.notification!.title);
      print('==================================');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      //dynamic route =event.data['route'];
      Navigator.of(_key.currentContext!).pushNamed(RedScreen.id);
    });

  }
}
