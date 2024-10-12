class AllCharacterEntity {
  AllCharactersInfoEntity? info;
  List<CharacterEntity>? results;
  AllCharacterEntity({this.info, this.results});

  AllCharacterEntity.empty()
      : info = AllCharactersInfoEntity.empty(),
        results = [];
}

class AllCharactersInfoEntity {
  int? count;
  int? pages;
  String? next;
  String? prev;

  AllCharactersInfoEntity({this.count, this.pages, this.next, this.prev});
  AllCharactersInfoEntity.empty()
      : count = 0,
        pages = 0,
        next = '',
        prev = '';
}

class CharacterEntity {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  CharacterOriginEntity? origin;
  CharacterOriginEntity? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  CharacterEntity(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});
}

class CharacterOriginEntity {
  String? name;
  String? url;

  CharacterOriginEntity({this.name, this.url});
}
