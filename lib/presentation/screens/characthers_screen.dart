import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/business_logic/characters_cubit.dart';
import 'package:flutterbloc/constans/colors.dart';
import 'package:flutterbloc/data/model/Character.dart';
import 'package:flutterbloc/presentation/widgets/character_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<Character> allCharacters;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.yellow,
        title: const Text(
          "Characters",
          style: TextStyle(color: MyColors.gray),
        ),
      ),
      body:buildBlocWidget(),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          return buildLoadedListWidget();
        } else {
          return showProgressIndicator();
        }
      },);
  }

  Widget showProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.yellow,
      ),
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.gray,
        child: Column(
          children: [
            buildCharatersList()
          ],
        ),
      ),
    );
  }

  Widget buildCharatersList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,


        ),
        itemCount: allCharacters.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return CharacterItem(character: allCharacters[index],);
        });
  }




}



