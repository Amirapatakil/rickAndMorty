import 'package:rick_and_morty_app/features/all_characters/data/source/remote/all_characters_remote_data_source.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/entity/all_character_entity.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/repository/all_character_repository.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/usecase/fetch_all_character_usecase.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/usecase/search_single_character.dart';

class AllCharacterRepositoryImpl implements AllCharacterRepository {
  final AllCharacterRemoteDataSource _dataSource;
  AllCharacterRepositoryImpl({required AllCharacterRemoteDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<AllCharacterEntity> fetchAllCharacters(
      {required FetchAllCharactersParams params}) async {
    return _dataSource.fetchAllCharacters(params: params);
  }

  @override
  Future<AllCharacterEntity> searchSingleCharacter(
      {required SearchSingleCharacterParams params}) async {
    return _dataSource.searchSingleCharacter(params: params);
  }
}
