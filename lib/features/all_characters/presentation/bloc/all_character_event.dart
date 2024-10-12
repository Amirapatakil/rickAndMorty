import 'package:rick_and_morty_app/base/presenattion/base_event.dart';

class AllCharacterEvent extends BaseEvent {}

class FetchAllCharactersEvent extends AllCharacterEvent {
  final int page;

  FetchAllCharactersEvent({required this.page});
}

class SearchSingleCharacterEvent extends AllCharacterEvent {
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final int? page;
  SearchSingleCharacterEvent({
    this.page,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
  });
}

class FilterAndSortCharactersEvent extends AllCharacterEvent {
  final String statusFilter;
  final String genderFilter;
  final int? page;
  final bool isSortAZ;

  FilterAndSortCharactersEvent({
    required this.page,
    required this.statusFilter,
    required this.genderFilter,
    required this.isSortAZ,
  });
}
