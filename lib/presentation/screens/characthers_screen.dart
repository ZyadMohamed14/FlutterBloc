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
  late List<Character> searchedForCharacters;
  bool isSearching = false;
  final _searchedTextController = TextEditingController();

  Widget buildSecrchFeild() {
    return TextField(
      cursorColor: MyColors.yellow,
      controller: _searchedTextController,
      decoration: InputDecoration(
          hintText: 'Find a character...',
          hintStyle: TextStyle(color: MyColors.gray, fontSize: 18)),
      style: TextStyle(color: MyColors.gray, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    setState(() {
      searchedForCharacters = allCharacters
          .where((character) =>
          character.name.toLowerCase().startsWith(searchedCharacter))
          .toList();

    });

  }

  List<Widget> buildAppbarActions() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              clearSearch();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.clear,
              color: MyColors.gray,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              startSearch();
            },
            icon: Icon(
              Icons.search,
              color: MyColors.gray,
            ))


      ];
    }
  }

  void startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearching() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      _searchedTextController.clear();
    });
  }

  Widget buildAppBarTitle() {
    return Text(
      "Characters",
      style: TextStyle(color: MyColors.gray),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.yellow,
        title: isSearching ? buildSecrchFeild() : buildAppBarTitle(),
        actions: buildAppbarActions(),
        leading: isSearching ? BackButton(color: MyColors.gray,):Container(),
      ),
      body: buildBlocWidget(),
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
      },
    );
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
          children: [buildCharatersList()],
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
        itemCount: _searchedTextController.text.isEmpty?allCharacters.length:searchedForCharacters.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return CharacterItem(
            character: _searchedTextController.text.isEmpty?allCharacters[index]:searchedForCharacters[index],
          );
        });
  }
}
