import 'dart:convert';
// import 'dart:js';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plate_planner/app/modules/home/views/home_view.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( 
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.instance.getToken().then((Value) {
    print("get token: $Value");
  });

//if application is bacground it works 
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    print("on message opend app: $message");
    Navigator.pushNamed(navigatorkey.currentState!.context,'/push-page',arguments: {"message",json.encode(message.data)});
  });

//if app is close  or tarminated 
  FirebaseMessaging.instance.getInitialMessage().then(
    (RemoteMessage? message) {
      if (message != null) {
        Navigator.pushNamed(navigatorkey.currentState!.context,'/push-page',arguments: {"message",json.encode(message.data)});

      }
    }
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      navigatorKey: navigatorkey,
      routes: {
        '/':((context)=>const HomeView()),
        '/push-page':((context)=>const HomeView()),
      },
    ),
  );
  
}

Future<void>_firebaseMessagingBackgroundHandler(RemoteMessage message)async{
    await Firebase.initializeApp();
    print("_firebaseMessagingBackgroundHandler:$message");
  }
