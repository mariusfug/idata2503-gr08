import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:idata2503_group08/main.dart';


class UserPost {
  UserPost({required this.title, this.content, this.picture});

  String title;
  String ?content;
  Image ?picture;

  int upVotes = 0;
  int downVotes = 0;


}
