import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class viewdetails extends StatelessWidget {
  var name_;
  var age_;
  var phone_;
  var address_;
  dynamic image_;

   viewdetails({super.key,
   required this.name_,
   required this.age_,
   required this.phone_,
   required this.address_,
   required this.image_});



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('LIST VIEW'),),
        body:Container(
          color: Colors.green,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: [
              SizedBox(
                height:150,
                width: 150,
                child: Image(image: FileImage(File(image_))),
              ),
              Text(name_),
              SizedBox(height: 50,),
              Text(age_),
               SizedBox(height: 50,),
              Text(phone_),
               SizedBox(height: 50,),
              Text(address_)
            ],
          ),
        )
        
    
    
    
    ));
  }
}