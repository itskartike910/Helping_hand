import 'package:alert_us/provider/user_provider.dart';
import 'package:alert_us/responsive/mobile_screen_layout.dart';

import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
<<<<<<< HEAD
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
=======
import 'package:provider/provider.dart';
>>>>>>> 889afda972e1e849b6c9bfd09e977c17bb615d81
import 'Authentication/Auth/NewHome.dart';
import 'Authentication/Auth/login.dart';
import 'Notifications/notifications.dart';
import 'firebase_options.dart';
FlutterLocalNotificationsPlugin notificationsPlugin=FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FlutterNotificationService().init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  log("Notifications");
  AndroidInitializationSettings androidInitializationSettings= const AndroidInitializationSettings("@mipmap/ic_launcher");
  InitializationSettings initializationSettings=InitializationSettings(android: androidInitializationSettings);
  bool? initialized = await notificationsPlugin.initialize(
    initializationSettings,
  );
  log("Notifications=$initialized");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      Notifications(),
      // (FirebaseAuth.instance.currentUser != null)
      //     ? const MobileScreenLayout()
      //     : const LoginPage(),
    );
  }
}




class StartingPage extends StatelessWidget {
  const StartingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // child: Image.asset('assets/images/Ecommerce.jpg'),
        // child: Image.asset('images/Ecommerce.jpg',fit: BoxFit.cover,scale: 1.0,),
        child: const Icon(
          Icons.start,
          size: 50,
          color: Colors.lightGreen,
=======
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return MobileScreenLayout();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.black),
              );
            }
            return const LoginPage();
          },
>>>>>>> 889afda972e1e849b6c9bfd09e977c17bb615d81
        ),
      ),
    );
  }
}

// class StartingPage extends StatelessWidget {
//   const StartingPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         // child: Image.asset('assets/images/Ecommerce.jpg'),
//         // child: Image.asset('images/Ecommerce.jpg',fit: BoxFit.cover,scale: 1.0,),
//         child: const Icon(
//           Icons.start,
//           size: 50,
//           color: Colors.lightGreen,
//         ),
//       ),
//     );
//   }
// }
