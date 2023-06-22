

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studentlist/model/data_model.dart';

ValueNotifier<List<StudetModel>>studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudetModel value)async{
final studentDB= await Hive.openBox<StudetModel>('student_db');
studentDB.add(value); 
  
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();

}
Future<void>getAllStudents()async{
final studentDB= await Hive.openBox<StudetModel>('student_db');
studentListNotifier.value.clear();
studentListNotifier.value.addAll(studentDB.values);
studentListNotifier.notifyListeners();
}

Future<void> deleteStudent( index)async{
final studentDB= await Hive.openBox<StudetModel>('student_db');
await studentDB.deleteAt(index);
getAllStudents();

}

Future<void>update(index,updation)async{
  final studentDB= await Hive.openBox<StudetModel>('student_db');
  studentDB.putAt(index, updation);
  studentListNotifier.value[index]=updation;
  studentListNotifier.notifyListeners();
}








