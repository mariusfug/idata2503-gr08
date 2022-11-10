import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:idata2503_group08/pages/add_post/select_group_to_post.dart';
import 'package:idata2503_group08/widgets/navigation/top_navigation.dart';
import 'package:idata2503_group08/services/validators.dart';
import 'package:provider/provider.dart';
import '../../model/post.dart';
import '../../services/repository.dart';
import 'package:idata2503_group08/widgets/navigation/bottom_navigation.dart';

class AddNewPost extends StatefulWidget {
  const AddNewPost({Key? key}) : super(key: key);

  @override
  State<AddNewPost> createState() => _AddNewPostState();
}

class _AddNewPostState extends State<AddNewPost> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  final TitleValidator _titleValidator = TitleValidator();

  late bool _fieldValidation;

  String get _title => _titleController.text;
  String get _content => _contentController.text;

  PlatformFile? file;
  FilePickerResult? result;


  bool _titleValid() {
    return _titleValidator.isValid(_title);
  }

  @override
  void initState() {
    super.initState();
    _fieldValidation = false;
  }

  void _updateState() {
    setState(() {
      if (_titleValid()) {
        _fieldValidation = false;
      }
    });
  }

  void _enableValidation() {
    setState(() {
      _fieldValidation = true;
    });
  }

  /// Click next button, should be called from 'Add post' button only
  /// Redirects to Select group page if title is valid
  void _clickNextButton(BuildContext context) async {
    try {
      if (!_titleValid()) {
        _enableValidation();
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectGroupToPost()));
      }
    } catch (e) {
      print(e.toString());
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavigation(),
      bottomNavigationBar: BottomNavigation(),
      backgroundColor: const Color(0xFF1E1E1E),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: const Color(0x1E1E1E1E),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              child: Stack(
                children: [
                  Column(children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: TextField(
                            key: const Key("postTitle"),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24),
                            controller: _titleController,
                            onChanged: (title) => _updateState(),
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: "Add a title",
                              hintStyle: const TextStyle(
                                  color: Colors.white70, fontSize: 24),
                              errorText: _titleValid() || !_fieldValidation
                                  ? null
                                  : 'Title cannot be empty!',
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: _buildNextButton(context),
                        )
                      ],
                    ),
                    TextField(
                      key: const Key("postDescription"),
                      style: const TextStyle(color: Colors.white),
                      maxLines: 8,
                      controller: _contentController,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        hintText: "Your text (optional)",
                        hintStyle:
                            TextStyle(color: Colors.white38, fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: ElevatedButton(
                          key: const Key("postImage"),
                          child: const Text("Attach image"),
                          onPressed: () {
                            pickFiles();
                          },
                        ),
                      ),
                      (file == null)
                          ? Container()
                          : Image.file(
                              File(file!.path.toString()),
                              width: 100,
                              height: 100,
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton(context) {
    return ElevatedButton(
        onPressed: !_fieldValidation ? () => _clickNextButton(context) : null,
        key: const Key("post_next_button"),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF007ACC),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          disabledBackgroundColor: Colors.white24,
          disabledForegroundColor: Colors.white,
        ),
        child: const Text("Next"));
  }

  void pickFiles() async {
    result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'mp4'],
        allowMultiple: true);
    if (result == null) return;

    file = result!.files.first;

    setState(() {});
  }
}
