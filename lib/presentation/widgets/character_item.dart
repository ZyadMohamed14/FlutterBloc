import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbloc/constans/colors.dart';
import 'package:flutterbloc/constans/strings.dart';
import 'package:flutterbloc/data/model/Character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: MyColors.gray, borderRadius: BorderRadius.circular(8)),

      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
              context, characterDetailsScreen, arguments: character);
        },
        child: GridTile(
          child: Hero(
            tag: character.id,
            child: Container(
              color: MyColors.gray,
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: 'assets/images/loading.gif',
                  image: character.image)
                  : Image.asset('assets/images/placeholder.png'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${character.name}',
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.white,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }


}
