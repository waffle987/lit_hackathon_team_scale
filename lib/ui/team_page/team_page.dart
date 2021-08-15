import 'package:flutter/material.dart';
import 'package:lit_hackathon_team_scale/config/ui_helpers.dart';
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
      return Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: 100,
          child: Card(
            margin: EdgeInsets.all(1),
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Positioned.fill(
                  child: Container(
                    child: Image.asset(photo,
                    fit: BoxFit.fill,),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: _mediaQuery.size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        verticalSpaceSmall,
                        Text(
                          bio,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
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
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 3.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.55,
          ),
          children: [
            _buildCard(
                name: 'Zhe Quan',
                bio:
                    'A student that loves to code and wants to contribute back to society through the varse knowledge he gained.                                                                    ',
                photo: 'assets/JJ.jpg'),
            _buildCard(
                name: 'Darren Ong',
                bio:
                    'Loves to explore the legal needs of companies from all perspectives.  Has experience in-house at a listed company and a start-up, as well as in private law firms. From these, he believes that tech is the key to improving legal processes.',
                photo: 'assets/Darren.jpg'),
            _buildCard(
                name: 'Jia Jun',
                bio:
                    'Jia Jun is a incoming freshman from the Nanyang Technological University. His passion for coding started during his National Service days, where he learned and picked up numerous coding languages. ',
                photo: 'assets/JJ.jpg'),
            _buildCard(
                name: 'Ben',
                bio:
                    'Ben is a Year 2 law student at the SMU School of Law. He is a self-taught full-stack developer and loves working on interesting and impactful projects.',
                photo: 'assets/Ben.jpg'),
          ],
        ),
      ),
    );
  }
}
