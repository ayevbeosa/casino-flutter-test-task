import 'package:equatable/equatable.dart';

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
