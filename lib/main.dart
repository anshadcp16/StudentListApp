import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studentlist/home_screen.dart';
import 'package:studentlist/list_student_widget.dart';
import 'package:studentlist/model/data_model.dart';

Future<void> main()async {
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(StudetModelAdapter().typeId)){
    Hive.registerAdapter(StudetModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const ListStudentWidget(),
    );
  }
}

