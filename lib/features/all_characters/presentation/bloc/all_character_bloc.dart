import 'dart:developer';

import 'package:rick_and_morty_app/base/presenattion/base_bloc.dart';
import 'package:rick_and_morty_app/core/enums/state_status.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/entity/all_character_entity.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/usecase/fetch_all_character_usecase.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/usecase/search_single_character.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/bloc/all_character_event.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/bloc/all_character_state.dart';

class AllCharacterBloc extends BaseBloc<AllCharacterEvent, AllCharacterState> {
  final FetchAllCharacterUsecase _allCharacterUsecase;
  List<CharacterEntity> allCharacters = [];
  List<CharacterEntity> searchList = [];
  List<CharacterEntity> sortedList = [];
  bool isSortAZ = false;
  bool isLoading = false;
  final SearchSingleCharacterUsecase _searchSingleCharacterUsecase;

  AllCharacterBloc({
    required SearchSingleCharacterUsecase searchSingleCharacterUsecase,
    required FetchAllCharacterUsecase allCharacterUsecase,
  })  : _allCharacterUsecase = allCharacterUsecase,
        _searchSingleCharacterUsecase = searchSingleCharacterUsecase,
        super(AllCharacterState(
            model: AllCharacterEntity.empty(), status: StateStatus.init)) {
    on<FetchAllCharactersEvent>((event, emit) async {
      print('Fetching characters...');
      searchList.clear();
      isLoading = true;
      emit(AllCharacterState(
        status: StateStatus.loading,
      ));
      try {
        bool hasMorePages = true;
        int currentPage = 1;
        List<CharacterEntity> fetchedCharacters = [];
        dynamic lastInfo;

        while (hasMorePages) {
          final result = await _allCharacterUsecase.execute(
            params: FetchAllCharactersParams(page: currentPage),
          );

          lastInfo = result.info;
          fetchedCharacters.addAll(result.results ?? []);
          hasMorePages = result.info?.next != null;
          currentPage++;
          allCharacters = fetchedCharacters;
        }
        emit(AllCharacterState(
            status: StateStatus.loaded,
            model: AllCharacterEntity(info: lastInfo, results: allCharacters)));
        isLoading = false;
        print('Character names: ${allCharacters.map((e) => e.name).toList()}');
        print('Fetched all characters: ${allCharacters.length}');
      } catch (e) {
        emit(AllCharacterState(status: StateStatus.error));
      }
    });
    on<SearchSingleCharacterEvent>(
      (event, emit) async {
        searchList.clear();
        try {
          final result = await _searchSingleCharacterUsecase.execute(
              params: SearchSingleCharacterParams(
                  type: event.type,
                  species: event.species,
                  gender: event.gender,
                  name: event.name,
                  status: event.status,
                  page: event.page));

          searchList.addAll(result.results ?? []);

          emit(AllCharacterState(
              status: StateStatus.loaded,
              model:
                  AllCharacterEntity(info: result.info, results: searchList)));
        } catch (e) {
          emit(AllCharacterState(status: StateStatus.error));
        }
      },
    );

    on<FilterAndSortCharactersEvent>((event, emit) {
      List<CharacterEntity> filteredList = List.from(allCharacters);

      if (event.isSortAZ) {
        filteredList.sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
      } else {
        if (event.statusFilter.isEmpty && event.genderFilter.isEmpty) {
          filteredList = [...allCharacters];
        }
      }
      if (event.statusFilter.isNotEmpty) {
        filteredList = filteredList
            .where((character) =>
                character.status?.toLowerCase() ==
                event.statusFilter.toLowerCase())
            .toList();
      }
      if (event.genderFilter.isNotEmpty) {
        filteredList = filteredList
            .where((character) =>
                character.gender?.toLowerCase() ==
                event.genderFilter.toLowerCase())
            .toList();
      }
      emit(AllCharacterState(
        status: StateStatus.loaded,
        model:
            AllCharacterEntity(info: state.model?.info, results: filteredList),
      ));
      log(filteredList.length.toString());
    });
  }
}
