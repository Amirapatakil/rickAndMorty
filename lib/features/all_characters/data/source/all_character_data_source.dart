import 'package:rick_and_morty_app/features/all_characters/data/model/all_characters_model.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/usecase/fetch_all_character_usecase.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/usecase/search_single_character.dart';

abstract class AllCharacterDataSource {
  Future<AllCharacterModel> fetchAllCharacters(
      {required FetchAllCharactersParams params});
  Future<AllCharacterModel> searchSingleCharacter(
      {required SearchSingleCharacterParams params});
}
