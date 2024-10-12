import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/features/all_characters/data/model/all_characters_model.dart';
import 'package:rick_and_morty_app/features/all_characters/data/source/all_character_data_source.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/usecase/fetch_all_character_usecase.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/usecase/search_single_character.dart';

class AllCharacterRemoteDataSource implements AllCharacterDataSource {
  final Dio _dio;

  AllCharacterRemoteDataSource({required Dio dio}) : _dio = dio;
  @override
  Future<AllCharacterModel> fetchAllCharacters(
      {required FetchAllCharactersParams params}) async {
    final response =
        await _dio.get('character', queryParameters: params.toJson());

    return AllCharacterModel.fromJson(response.data);
  }

  @override
  Future<AllCharacterModel> searchSingleCharacter(
      {required SearchSingleCharacterParams params}) async {
    final response =
        await _dio.get('character', queryParameters: params.toJson());
    return AllCharacterModel.fromJson(response.data);
  }
}
