

import 'package:hive/hive.dart';
part 'data_model.g.dart';  

@HiveType(typeId: 1)
class StudetModel{

  // @HiveField(0)
  //  int? id;

  @HiveField(0)
   final String name;


   @HiveField(1)
   final String age;

   @HiveField(2)
   final String phone;

   @HiveField(3)
   final String address;

   @HiveField(4)
   final String i_mage;
      StudetModel({required this.name,required this.age,required this.phone,required this.address,required this.i_mage});
} 