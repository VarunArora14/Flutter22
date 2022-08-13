import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/constants/colors.dart';
import 'package:whatsapp_ui/firebase_options.dart';
import 'package:whatsapp_ui/utils/responsive_layout.dart';
import 'package:whatsapp_ui/screens/mobile_layout.dart';
import 'package:whatsapp_ui/screens/web_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// used for initializing firebase app as WidgetFlutterBinding is used to interact with flutter engine. Firebase.initializeApp() needs to call native code to initialize
// Firebase, and since the plugin needs to use platform channels to call the native code, which is done asynchronously therefore you have to call ensureInitialized() to
// make sure that you have an instance of the WidgetsBinding.

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const ResponsiveLayout(
        mobileLayout: MobileLayout(),
        webLayout: WebLayout(),
      ),
      // both are widgets(scaffolds) being used to decide the layout
    );
  }
}
