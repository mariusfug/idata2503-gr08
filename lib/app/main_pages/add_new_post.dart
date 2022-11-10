import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:idata2503_group08/app/navigation/top_navigation.dart';
import 'package:idata2503_group08/services/validators.dart';
import 'package:provider/provider.dart';
import '../../model/post.dart';
import '../../services/repository.dart';
import '../navigation/bottom_navigation.dart';

class AddNewPost extends StatefulWidget {
  const AddNewPost({Key? key}) : super(key: key);

  @override
  State<AddNewPost> createState() => _AddNewPostState();
}

class _AddNewPostState extends State<AddNewPost> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  final TitleValidator _titleValidator = TitleValidator();

  String get _title => _titleController.text;

  String get _content => _contentController.text;

  late bool _fieldValidation;
  late bool _buttonDisabled;

  PlatformFile? file;
  FilePickerResult? result;

  bool _titleValid() {
    return _titleValidator.isValid(_title);
  }

  @override
  void initState() {
    super.initState();
    _fieldValidation = false;
    _buttonDisabled = false;
  }

  void _updateState() {
    setState(() {
      if (_titleValid()) {
        _buttonDisabled = false;
        _fieldValidation = false;
      }
    });
  }

  void _enableValidation() {
    setState(() {
      _fieldValidation = true;
    });
  }

  void _disableButton() {
    setState(() {
      _buttonDisabled = true;
    });
  }

  /// Add new post, should be called from 'Add post' button only
  void _addPost(BuildContext context) async {
    try {
      if (!_titleValid()) {
        _enableValidation();
        _disableButton();
      } else {
        Repository repository = Provider.of<Repository>(context, listen: false);
        repository.addPostWithAutogeneratedId(
            'groups/general/posts',
            Post(
                title: _title,
                content: _content,
                upVote: 0,
                downVote: 0,
                boardTag: "all"));
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
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Title",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextField(
                    key: const Key("postTitle"),
                    style: const TextStyle(color: Colors.white),
                    controller: _titleController,
                    onChanged: (title) => _updateState(),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: "Enter title",
                      hintStyle: const TextStyle(color: Colors.white24),
                      errorText: _titleValid() || !_fieldValidation
                          ? null
                          : 'Title cannot be empty!',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Description",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextField(
                    key: const Key("postDescription"),
                    style: const TextStyle(color: Colors.white),
                    maxLines: 8,
                    controller: _contentController,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: "Enter description",
                      hintStyle: TextStyle(color: Colors.white24),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: ElevatedButton(
                        key: const Key("postImage"),
                        child: const Text("pick a file"),
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
                    _buildAddPostButton(context),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddPostButton(context) {
    return ElevatedButton(
        onPressed: !_fieldValidation ? () => _addPost(context) : null,
        key: const Key("add_post_button"),
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.white24,
          disabledForegroundColor: Colors.white,
        ),
        child: const Text("Add post"));
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
