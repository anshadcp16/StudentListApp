import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:studentlist/add_student_widget.dart';
import 'package:studentlist/db/functions/db_functions.dart';
import 'package:studentlist/model/data_model.dart';
import 'package:studentlist/model/updatedetails.dart';
import 'package:studentlist/model/viewdetails.dart';

class ListStudentWidget extends StatelessWidget {
   const ListStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('STUDENT LIST'),),
        floatingActionButton:FloatingActionButton(onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>AddStudentWidget()),
          );
        },
        child:const Icon(Icons.add)
        ),
        body: ValueListenableBuilder(
                      valueListenable:studentListNotifier ,
                      builder: (BuildContext ctx, List<StudetModel> studentList, Widget? child){
                        return ListView.separated(
                        itemBuilder:(ctx,index){
                          final data=studentList[index];
                        return ListTile(
                          title: Text(data.name),
                          subtitle: Text(data.age),
                          leading: CircleAvatar(
                            backgroundImage: FileImage(File(data.i_mage)),
                          ),
                          trailing:
                          SizedBox(
                            width: 100,
                            child: Row(children:
                             [ IconButton(
                              onPressed: (){
                                deleteStudent(index);
                                // if(data.id!=null){
                                //   deleteStudent(data.id!);
                                // }else{
                                //   print('hi');
                                // }
                               }, 
                               icon:const Icon(Icons.delete,color: Colors.red,)),
                               IconButton(onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>updatedetais(
                                  index: index,
                                name: data.name,
                                age: data.age,
                                phone: data.phone,
                                address: data.address,
                                image:data.i_mage
                                )));
                               }, icon:const Icon(Icons.edit))],
                            ),
                          ),
                                            
                          onTap:(){
                             Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>viewdetails(
                              name_: data.name,
                              age_: data.age,
                              phone_: data.phone,
                              address_: data.address,
                              image_: data.i_mage,
                        
                              
                             )
                             )
                             );
                          },
                        );
                        }, separatorBuilder:(ctx,index){
                        return const Divider();
                                          
                        },
                         itemCount:studentList.length,
                        );
                      },
                      
                ),
      ),
    );
        

    

  }
}

