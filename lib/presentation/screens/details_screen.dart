import 'package:flutter/material.dart';
import 'package:flutterbloc/constans/colors.dart';
import 'package:flutterbloc/constans/strings.dart';
import 'package:flutterbloc/data/model/Character.dart';
import 'package:flutterbloc/data/model/Location.dart';
import 'package:flutterbloc/presentation/screens/location_screen.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;


  const CharacterDetailsScreen({super.key, required this.character});


  @override
  Widget build(BuildContext context) {
    print(character.location.url);
    return Scaffold(
      backgroundColor: MyColors.gray,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    characterInfo('gender : ', character.gender),
                  buildDivider('job'.length.toDouble()),
                  characterInfo('status : ', character.status),
                  characterInfo('Appeared in  : ', '${character.episode.length} Episodes'),
                  buildDivider('job'.length.toDouble()),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context,locationDetailsScreen);
                    },
                    child: Text('View Location'),
                  ),

                ],
              ),
            )
          ])),
        ],
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(
            color: MyColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            color: MyColors.white,
            fontSize: 16,
          ),
        )
      ]),
    );
  }

  Widget buildDivider(double end) {
    return Divider(
      height: 30,
      endIndent: end,
      thickness: 2,
      color: MyColors.yellow,
    );
  }

  Widget buildSliverAppBar() {

    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.gray,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }


}
