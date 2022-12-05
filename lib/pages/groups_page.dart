import 'package:flutter/material.dart';
import 'package:idata2503_group08/pages/groups/create_group.dart';
import 'package:idata2503_group08/widgets/group_circular_button.dart';
import 'package:idata2503_group08/widgets/navigation/bottom_navigation.dart';
import 'package:idata2503_group08/widgets/navigation/top_navigation.dart';
import 'package:provider/provider.dart';

import '../model/group.dart';
import '../services/repository.dart';

class GroupsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1E1E1E),
        appBar: TopNavigation(),
        bottomNavigationBar: const BottomNavBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: const Color(0xFF2D2D30),
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      RawMaterialButton(
                          onPressed: () {
                            MaterialPageRoute materialPageRoute =
                                MaterialPageRoute(
                                    builder: (context) => const CreateGroup());
                            Navigator.of(context).push(materialPageRoute);
                          },
                          elevation: 5.0,
                          fillColor: const Color(0xCC007ACC),
                          shape: const CircleBorder(),
                          child: const ImageIcon(
                            AssetImage("resources/icons/plus_outline.png"),
                            size: 40,
                            color: Colors.white,
                          )),
                      _buildGroupCards(context)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  /// Build post cards from all entries in general
  Widget _buildGroupCards(BuildContext context) {
    final Repository repository =
        Provider.of<Repository>(context, listen: false);
    return StreamBuilder<Iterable<Group>?>(
      stream: repository.getGroupsStream(orderBy: "name"),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.active ||
            !snapshot.hasData ||
            snapshot.data == null) {
          return const Text("Loading...");
        }
        final Iterable<Group> groups = snapshot.data!;
        final List<Widget> groupCards =
            groups.map((group) => GroupCircularButton(group)).toList();

        return Wrap(spacing: 60, runSpacing: 40, children: groupCards);
      },
    );
  }
}
