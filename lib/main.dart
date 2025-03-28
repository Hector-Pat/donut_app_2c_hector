import 'package:donut_app_2c_hector/pages/home_page.dart';
import 'package:flutter/material.dart';
//estas librerías pertenecen a firebase después de haberlas implementado en CMD
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  //Asegura que Flutter esté completamente inicializado antes de Firebase.
  WidgetsFlutterBinding.ensureInitialized();
  //inicializa Firebase usando la configuración generada en firebase_options.dart
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(indicatorColor: Colors.pink,),
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
