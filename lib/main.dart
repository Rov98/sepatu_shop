import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sepatu_shop/controller/item_controller.dart';
import 'package:sepatu_shop/firebase_options.dart';
import 'package:sepatu_shop/helper/provider_helper.dart';
import 'package:sepatu_shop/screens/authscreen.dart';
import 'package:sepatu_shop/screens/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sepatu_shop/screens/theme/appTheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Item_Controller(),
      child: MaterialApp(
          title: 'Shop App',
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
          theme: AppTheme().themeData(),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomePage();
              } else {
                return const AuthScreen();
              }
            },
          )),
    );
  }
}
