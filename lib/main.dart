import 'package:flutter/material.dart';
import 'common/models/word_model.dart';
import 'home/widgets/home_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magic The Dictionary',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color.fromRGBO(12, 15, 17, 100),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white))),
      home: const MyHomePage(),
    );
  }
}

class MyAppState extends ChangeNotifier {
  //To do favorite and history
}
