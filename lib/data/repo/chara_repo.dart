import 'package:flutterbloc/data/model/Character.dart';
import 'package:flutterbloc/data/web_services/character_services.dart';

class CharacterRepository {
  final CharacterWebServices characterWebServices;
  CharacterRepository(this.characterWebServices);
  Future<List<dynamic>> getAllCharacters() async {
    final characters = await characterWebServices.getAllCharacter();
    return characters.map((character) => Character.fromJson(character)).toList();
  }

}