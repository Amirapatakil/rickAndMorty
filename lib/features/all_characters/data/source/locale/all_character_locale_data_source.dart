import 'package:rick_and_morty_app/features/all_characters/data/model/all_characters_model.dart';
import 'package:rick_and_morty_app/features/all_characters/data/source/all_character_data_source.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/usecase/fetch_all_character_usecase.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/usecase/search_single_character.dart';

class AllCharacterLocaleDataSource implements AllCharacterDataSource {
  @override
  Future<AllCharacterModel> fetchAllCharacters(
      {required FetchAllCharactersParams params}) {
    // TODO: implement fetchAllCharacters
    throw UnimplementedError();
  }

  @override
  Future<AllCharacterModel> searchSingleCharacter(
      {required SearchSingleCharacterParams params}) {
    // TODO: implement searchSingleCharacter
    throw UnimplementedError();
  }
}
