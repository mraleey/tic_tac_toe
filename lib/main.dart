import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/view/home.dart';
import '../data/helper/dependencies.dart' as dependencies;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Attendance',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      home: HomeView(),
    );
  }
}
