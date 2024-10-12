import 'package:rick_and_morty_app/features/all_characters/domain/entity/all_character_entity.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/usecase/fetch_all_character_usecase.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/usecase/search_single_character.dart';

abstract class AllCharacterRepository {
  Future<AllCharacterEntity> fetchAllCharacters(
      {required FetchAllCharactersParams params});

  Future<AllCharacterEntity> searchSingleCharacter(
      {required SearchSingleCharacterParams params});
}
