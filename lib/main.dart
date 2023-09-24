import 'package:drawtism/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DrawTism',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
