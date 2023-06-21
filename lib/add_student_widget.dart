import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:studentlist/db/functions/db_functions.dart';
import 'package:studentlist/list_student_widget.dart';
import 'package:studentlist/model/data_model.dart';
import 'package:image_picker/image_picker.dart';

class AddStudentWidget extends StatefulWidget {
   AddStudentWidget({super.key});

  @override
  State<AddStudentWidget> createState() => _AddStudentWidgetState();
}

class _AddStudentWidgetState extends State<AddStudentWidget> {
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _phonecontrolller = TextEditingController();

  final _addresscontroller = TextEditingController();

  File? file;

  ImagePicker image=ImagePicker();

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('ADD LIST'),),
        body: Padding(padding: const EdgeInsets.all(10),
            child:ListView(
              children: [
                Container(
                child:CircleAvatar(
                  radius: 80,
                  child: file==null
                  ? const CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage('image/pictureimage.jpg'),
                  )
                  : SizedBox(
                      height: 200,
                       width: 180,
                       child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child:Image.file(
                          file!,
                          fit: BoxFit.fill,
                        )
                       ),
                )
                )
               
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ SizedBox(
                        width: 150,
                        height: 30,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                            onPressed: (){
                                getcam();
                            },
                            child: Text('TAKE PICTURE',
                            style:TextStyle(color: Colors.white) ,),
                          ),
                        ),
                        SizedBox(
                        width: 150,
                        height: 30,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                            onPressed: (){
                                getgall();
                            },
                            child: Text('FROM GALLERY',
                            style:TextStyle(color: Colors.white) ,),
                          ),
                        ),
                        ],
                  ),
                ),
                SizedBox(height: 25,),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'name',
                    ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'age'
                  ),
                ),
                const SizedBox(height: 10,),
                 TextFormField(
                  controller: _phonecontrolller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'phone'
                  ),
                ),
                const SizedBox(height: 10,),
                 TextFormField(
                  controller: _addresscontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Address'
                  ),
                ),
                ElevatedButton.icon(onPressed: (){
                  onAddStudentButtonClicked() ;
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const ListStudentWidget()));
                }, icon: const Icon(Icons.add), label:const Text('Add Student'),
                ), 
              ],
            ),
            ),
      ),
    );



  
    
  }

  Future<void>onAddStudentButtonClicked() async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final phone = _phonecontrolller.text.trim();
    final address = _addresscontroller.text.trim();
    if(name.isEmpty ||
    age.isEmpty ||
    phone.isEmpty||
    address.isEmpty||
    file!.path.isEmpty){
      return;
    }
    
     final student= StudetModel(name: name, age:age,phone: phone,address: address,i_mage: file!.path);
     addStudent(student);
      
  }

  Future getcam()async{
    var img=await image.pickImage(source: ImageSource.camera);
    setState(() {
      file =File(img!.path);
    });

  }
  Future getgall()async{
    var img=await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file =File(img!.path);
    });
  }
}