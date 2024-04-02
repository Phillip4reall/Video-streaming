import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:video_streaming/Screens/splash.dart';
import 'package:video_streaming/Services/provider.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCr3zcRmp71lR7TlEDJ7UozLhYrtLPcPks',
          appId: '1:195398373541:android:653689274b8df8e35c3d4c',
          messagingSenderId: '195398373541',
          projectId: 'videostreaming-75615'));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MainSreenNotifiers())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      //home: Allvideo(),
    );
  }
}
