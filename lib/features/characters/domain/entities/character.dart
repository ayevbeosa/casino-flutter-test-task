import 'package:equatable/equatable.dart';

class PaginatedCharacter extends Equatable {
  final PaginationInfo info;
  final List<Character> results;

  const PaginatedCharacter({
    required this.info,
    required this.results,
  });

  @override
  List<Object?> get props => [info, results];
}

class PaginationInfo extends Equatable {
  final num count;
  final num pages;
  final String? next;
  final String? prev;

  const PaginationInfo({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  @override
  List<Object?> get props => [count, pages, next, prev];
}

class Character extends Equatable {
  final num id;
  final String name;
  final String image;
  final String gender;
  final String species;
  final String status;
  final List<String> episode;
  final Location location;

  const Character({
    required this.id,
    required this.name,
    required this.image,
    required this.gender,
    required this.species,
    required this.status,
    required this.episode,
    required this.location,
  });

  @override
  List<Object?> get props =>
      [id, name, image, gender, species, episode, status, location];
}

class Location extends Equatable {
  final String name;
  final String url;

  const Location({
    required this.name,
    required this.url,
  });

  @override
  List<Object?> get props => [name, url];
}
