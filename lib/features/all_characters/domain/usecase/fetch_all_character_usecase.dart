import 'package:rick_and_morty_app/base/domain/base_params.dart';
import 'package:rick_and_morty_app/base/domain/base_usecase.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/entity/all_character_entity.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/repository/all_character_repository.dart';

class FetchAllCharacterUsecase
    extends BaseUsecase<AllCharacterEntity, FetchAllCharactersParams> {
  final AllCharacterRepository _repository;
  FetchAllCharacterUsecase({required AllCharacterRepository repository})
      : _repository = repository;

  @override
  Future<AllCharacterEntity> execute(
      {required FetchAllCharactersParams params}) {
    return _repository.fetchAllCharacters(params: params);
  }
}

class FetchAllCharactersParams extends BaseParams {
  final int page;

  FetchAllCharactersParams({required this.page});
  @override
  Map<String, dynamic> toJson() {
    return {'page': page};
  }
}
