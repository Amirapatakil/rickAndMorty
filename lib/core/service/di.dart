import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/core/service/dio.dart';
import 'package:rick_and_morty_app/core/service/shared_prefs.dart';
import 'package:rick_and_morty_app/features/all_characters/data/repository/all_character_repository_impl.dart';
import 'package:rick_and_morty_app/features/all_characters/data/source/remote/all_characters_remote_data_source.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/usecase/fetch_all_character_usecase.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/usecase/search_single_character.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/bloc/all_character_bloc.dart';

void setup({required GetIt di}) {
  di.registerSingleton(SharedPrefs());
  di.registerSingleton(Dio());
  di.registerSingleton(
    AllCharacterBloc(
      allCharacterUsecase: FetchAllCharacterUsecase(
          repository: AllCharacterRepositoryImpl(
              dataSource: AllCharacterRemoteDataSource(dio: DioSetting().dio))),
      searchSingleCharacterUsecase: SearchSingleCharacterUsecase(
          repository: AllCharacterRepositoryImpl(
              dataSource: AllCharacterRemoteDataSource(dio: DioSetting().dio))),
    ),
  );
}
