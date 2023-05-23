import 'package:cached_network_image/cached_network_image.dart';
import 'package:casino_test/features/characters/domain/entities/character.dart';
import 'package:flutter/material.dart';

class CharacterListItem extends StatelessWidget {
  final Character character;
  final bool active;

  const CharacterListItem({
    Key? key,
    required this.character,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(padding: EdgeInsets.only(top: size.height * 0.1)),
        CachedNetworkImage(
          imageUrl: character.image,
          imageBuilder: (context, imageProvider) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: size.height * 0.4,
              width: size.width * 0.8,
              margin: EdgeInsets.all(active ? 12.0 : 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          placeholder: (context, url) => SizedBox(
            height: size.height * 0.4,
            width: size.width * 0.8,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        const Padding(padding: EdgeInsets.only(top: 24.0)),
        Text(
          character.name,
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 24.0,
          ),
          child: Text(
            '${character.name} is a ${character.gender} ${character.species}, from ${character.location.name}. '
            '${character.name} is featured in ${character.episode.length} episodes in the entire show.\n'
            '${character.name} was last known to be ${character.status}',
            style: textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
