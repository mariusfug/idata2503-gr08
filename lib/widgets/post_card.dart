import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:idata2503_group08/services/firestore/api_paths.dart';
import 'package:idata2503_group08/services/firestore/firestore_repository.dart';
import 'package:provider/provider.dart';

import '../../model/post.dart';
import '../services/format_time.dart';

class PostCard extends StatefulWidget {
  final Post post;
  final String collection;

  const PostCard(this.post, this.collection, {Key? key}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool upvoted = false;
  bool downvoted = false;
  final Color _iconColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<voteCounter>(context, listen: false);
    final downVoteCounterModel =
        Provider.of<downVoteCounter>(context, listen: false);

    return FractionallySizedBox(
      widthFactor: 0.95,
      child: Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: const Color(0xFF2D2D30),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ("${widget.post.boardTag}  •  username"),
                    style: const TextStyle(fontSize: 14, color: Colors.white38),
                  ),
                  Text(
                    FormatTime.formatTime(widget.post.createdAt),
                    style: const TextStyle(color: Colors.white38),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Text(widget.post.title,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const Divider(height: 15, color: Colors.white, thickness: 1),
              (widget.post.content == null)
                  ? Container()
                  : Text(widget.post.content!,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.white)),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (upvoted == false) {
                        counterModel.upVote();
                        widget.post.upVote++;
                        FirebaseFirestore.instance
                            .collection('groups/${widget.collection}/posts')
                            .doc(widget.post.postID)
                            .update({
                          'upvote': FieldValue.increment(1),
                        });
                      } else {
                        counterModel.upVote();
                        widget.post.upVote--;
                        FirebaseFirestore.instance
                            .collection('groups/${widget.collection}/posts')
                            .doc(widget.post.postID)
                            .update({
                          'upvote': FieldValue.increment(-1),
                        });
                      }
                      upvoted = !upvoted;
                      downvoted = false;

                      setState(() {
                        _iconColor;
                      });
                    },
                    icon: ImageIcon(
                      const AssetImage("resources/icons/upvote.png"),
                      color: upvoted ? Colors.blue : Colors.white,
                      size: 15,
                    ),
                  ),
                  Text(
                    "${widget.post.upVote}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      if (downvoted == false) {
                        downVoteCounterModel.downVote();
                        widget.post.downVote++;
                        FirebaseFirestore.instance
                            .collection(ApiPaths.group("groups/general/posts"))
                            .doc(widget.post.postID)
                            .update({
                          'downvote': FieldValue.increment(1),
                        });
                      } else {
                        downVoteCounterModel.downVote();
                        widget.post.downVote--;
                        FirebaseFirestore.instance
                            .collection('groups/general/posts')
                            .doc(widget.post.postID)
                            .update({
                          'downvote': FieldValue.increment(-1),
                        });
                      }
                      downvoted = !downvoted;
                      upvoted = false;

                      setState(() {});
                    },
                    icon: ImageIcon(
                      const AssetImage("resources/icons/downvote.png"),
                      color: downvoted ? Colors.orange : Colors.white,
                      size: 15,
                    ),
                  ),
                  Text(
                    "${widget.post.downVote}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class voteCounter with ChangeNotifier {
  int _voteCounter = 0;

  getCounter() => _voteCounter;
  setCounter(int voteCounter) => _voteCounter = voteCounter;

  void upVote() {
    _voteCounter++;
    notifyListeners();
  }

  void downVote() {
    _voteCounter--;
    notifyListeners();
  }
}

class downVoteCounter with ChangeNotifier {
  int _downVoteCounter = 0;

  getDownCounter() => _downVoteCounter;
  setDownCounter(int downVoteCounter) => _downVoteCounter = downVoteCounter;

  void upVoteDownVote() {
    _downVoteCounter++;
    notifyListeners();
  }

  void downVote() {
    _downVoteCounter--;
    notifyListeners();
  }
}
