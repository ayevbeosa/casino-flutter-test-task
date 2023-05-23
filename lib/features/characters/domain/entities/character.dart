import 'package:equatable/equatable.dart';

class PaginatedCharacter extends Equatable {
  final PaginationInfo info;
  final List<Character> results;

  PaginatedCharacter({
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

  PaginationInfo({
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

  Character({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];
}
