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
      required String photo,
    }) {
      return Container(
        height: 500,
        child: Card(
          margin: EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    child: Image.asset(photo),
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
            _buildCard(name: 'Zhe Quan', bio: 'Hi', photo: 'assets/JJ.jpg'),
            _buildCard(name: 'Darren Ong', bio: 'Loves to explore the legal needs of companies from all perspectives.  Has experience in-house at a listed company and a start-up, as well as in private law firms. From these, he believes that tech is the key to improving legal processes,  simultaneously reducing time and costs whilst increasing accuracy and reliability. In his spare time, he loves hunting down good food and volunteering with People with Intellectual Disabilities', photo: 'assets/Darren.jpg'),
            _buildCard(name: 'Jia Jun', bio: 'Jia Jun is a incoming freshman from the Nanyang Technological University. His passion for coding started during his National Service days, where he learned and picked up numerous coding languages. During his free time, he loves running and is also a avid traveller/hiker, exploring different parts of Singapore by foot and cycling.', photo: 'assets/JJ.jpg'),
            _buildCard(name: 'Ben', bio: 'Ben is a Year 2 law student at the SMU School of Law. He is a self-taught full-stack developer and loves working on interesting and impactful projects.', photo: 'assets/Ben.jpg'),
          ],
        ),
      ),
    );
  }
}
