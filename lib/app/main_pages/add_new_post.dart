


import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:idata2503_group08/app/navigation/top_navigation.dart';

import '../navigation/bottom_navigation.dart';

class AddNewPost extends StatelessWidget {
  const AddNewPost({Key? key}) : super(key: key);

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
                const TextField(decoration: InputDecoration(labelText: "Post Title", labelStyle:TextStyle(color: Colors.white),),),
                const TextField(decoration: InputDecoration(labelText: "Post Description", labelStyle:TextStyle(color: Colors.white),),),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: ElevatedButton(child: Text("pick a file"),onPressed: (){pickFiles();
                    },),

                  )
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(onPressed: (){print("Submited");}, child: const Text("Add post"))
              ]
          ),

        ),
      ),
      );

  }

  void pickFiles() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    PlatformFile? file = result!.files.first;
  }

}
