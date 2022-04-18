import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management_app/db/functions/db_functions.dart';
import 'package:student_management_app/db/model/data_model.dart';
import 'package:student_management_app/screens/home/screen_home.dart';

main(List<String> args) async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentmodelAdapter().typeId)) {
    Hive.registerAdapter(StudentmodelAdapter());
  }
  await loadAllStudents();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const ScreenHome(),
    );
  }
}
