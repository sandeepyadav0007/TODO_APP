import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/pages/home_page.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // init the hive
  await Hive.initFlutter();


  // open a box
  var box =await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',

      
      home: const HomePage(),
      theme :ThemeData(primarySwatch: Colors.yellow,
      appBarTheme: const AppBarTheme(
          color: Colors.yellow,
        )),
      
       );
  }
}

