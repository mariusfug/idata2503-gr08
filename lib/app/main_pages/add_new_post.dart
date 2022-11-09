


import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:idata2503_group08/app/navigation/top_navigation.dart';


import '../navigation/bottom_navigation.dart';

class AddNewPost extends StatefulWidget{
  const AddNewPost({Key? key}) :super(key:key);

  @override
  _AddNewPost createState() => _AddNewPost();
}


class _AddNewPost extends State<AddNewPost> {
  PlatformFile? file;
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const TopNavigation(),
      bottomNavigationBar: BottomNavigation(),
      body: Container(
        color: const Color(0xFF1E1E1E),
        child: Card(
          color: const Color(0xff1e1e1e1e),
          child: Column(
            mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const TextField(key: Key("postTitle"), decoration: InputDecoration(labelText: "Post Title", labelStyle:TextStyle(color: Colors.white),),),
                const TextField(key: Key("postDescription") , decoration: InputDecoration(labelText: "Post Description", labelStyle:TextStyle(color: Colors.white),),),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: ElevatedButton(key: const Key("postImage"),child: const Text("pick a file"),onPressed: (){pickFiles();

                  },),
                ),
                (file==null)?Container(): Image.file(File(file!.path.toString()),width: 100,height: 100,),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(key: const Key("submitButton") ,onPressed: (){print("Submited");}, child: const Text("Add post"))
              ]
          ),

        ),
      ),
      );

  }

  void pickFiles() async{
    result = await FilePicker.platform.pickFiles(
      type:FileType.custom,
      allowedExtensions: ['jpg','png','mp4'],
      allowMultiple: true
    );
    if (result == null) return;

    file = result!.files.first;

    setState(() {

    });

  }

}
