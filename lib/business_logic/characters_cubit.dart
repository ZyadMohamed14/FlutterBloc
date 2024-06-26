import 'package:bloc/bloc.dart';
import 'package:flutterbloc/data/model/Character.dart';
import 'package:flutterbloc/data/repo/chara_repo.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
   List<Character>characters = [];

  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    characterRepository.getAllCharacters().then((characters)  {
    emit(CharactersLoaded(characters));
        this.characters = characters;
    });
    return characters;
  }




}
