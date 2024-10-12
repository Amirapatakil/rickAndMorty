import 'package:rick_and_morty_app/base/domain/base_params.dart';
import 'package:rick_and_morty_app/base/domain/base_usecase.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/entity/all_character_entity.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/repository/all_character_repository.dart';

class SearchSingleCharacterUsecase
    extends BaseUsecase<AllCharacterEntity, SearchSingleCharacterParams> {
  final AllCharacterRepository _repository;

  SearchSingleCharacterUsecase({required AllCharacterRepository repository})
      : _repository = repository;
  @override
  Future<AllCharacterEntity> execute(
      {required SearchSingleCharacterParams params}) {
    return _repository.searchSingleCharacter(params: params);
  }
}

class SearchSingleCharacterParams extends BaseParams {
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final int? page;
  SearchSingleCharacterParams(
      {required this.page,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender});

  @override
  Map<String, dynamic> toJson() {
    return {
      "page": page,
      "name": name,
      "status": status,
      "species": species,
      "type": type,
      "gender": gender
    };
  }
}
