import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  String id;
  String name;
  String leader;
  List<String> members;

  Group({
    required this.id,
    required this.name,
    required this.leader,
    required this.members,
});



}