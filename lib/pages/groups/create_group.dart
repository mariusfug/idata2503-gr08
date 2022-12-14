import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:idata2503_group08/model/group.dart';
import 'package:idata2503_group08/pages/add_post/select_group_to_post.dart';
import 'package:idata2503_group08/pages/groups_page.dart';
import 'package:idata2503_group08/services/repository.dart';
import 'package:idata2503_group08/services/validators.dart';
import 'package:idata2503_group08/widgets/navigation/bottom_navigation.dart';
import 'package:idata2503_group08/widgets/navigation/top_navigation.dart';
import 'package:provider/provider.dart';

import '../../model/post.dart';
import '../../services/firestore/api_paths.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  final TextEditingController _nameController = TextEditingController();
  final TitleValidator _nameValidator = TitleValidator();

  late bool _fieldValidation;

  String get _name => _nameController.text;

  PlatformFile? file;
  FilePickerResult? result;

  bool _titleValid() {
    return _nameValidator.isValid(_name);
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
        try {
          Repository repository =
              Provider.of<Repository>(context, listen: false);
          repository.addGroupWithAutogeneratedId(Group(id: "", name: _name));
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (context) => GroupsPage());
          Navigator.of(context).push(materialPageRoute);
        } catch (e) {
          print(e.toString());
        }
        ;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: TopNavigation(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: const Color(0xFF2D2D30),
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
                            key: const Key("name"),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24),
                            controller: _nameController,
                            onChanged: (name) => _updateState(),
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: "Add a name",
                              hintStyle: const TextStyle(
                                  color: Colors.white70, fontSize: 24),
                              errorText: _titleValid() || !_fieldValidation
                                  ? null
                                  : 'Name cannot be empty!',
                            ),
                          ),
                        ),
                        _buildNextButton(context),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildNextButton(context) {
    return ElevatedButton(
        onPressed: !_fieldValidation
            ? () => {
                  _clickNextButton(context),
                }
            : null,
        key: const Key("post_next_button"),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xCC007ACC),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          disabledBackgroundColor: Colors.white24,
          disabledForegroundColor: Colors.white,
        ),
        child: const Text("Create"));
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
