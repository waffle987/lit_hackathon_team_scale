import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lit_hackathon_team_scale/widgets/centred_view.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    Widget _buildCard({
      required String name,
      required String bio,
    }) {
      return Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: 150,
                  width: 450,
                  child: Icon(
                    FontAwesomeIcons.solidUser,
                    color: Colors.white,
                    size: 80,
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              height: _mediaQuery.size.height * 0.125,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      bio,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('RoboDoc Team'),
      ),
      body: CenteredView(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 100.0,
            childAspectRatio: 2,
          ),
          children: [
            _buildCard(name: 'Zhe Quan', bio: 'Hi'),
            _buildCard(name: 'Darren Ong', bio: 'Hi'),
            _buildCard(name: 'Jia Jun', bio: 'Hi'),
            _buildCard(name: 'Ben', bio: 'Hi'),
          ],
        ),
      ),
    );
  }
}
