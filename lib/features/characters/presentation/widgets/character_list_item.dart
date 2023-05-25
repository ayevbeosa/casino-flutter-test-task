import 'package:cached_network_image/cached_network_image.dart';
import 'package:casino_test/features/characters/domain/entities/character.dart';
import 'package:flutter/material.dart';

class CharacterListItem extends StatelessWidget {
  final Character character;

  const CharacterListItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: character.image,
            imageBuilder: (context, imageProvider) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: size.height * 0.35,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            placeholder: (context, url) => SizedBox(
              height: size.height * 0.35,
              width: size.width * 0.8,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const Padding(padding: EdgeInsets.only(top: 24.0)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              character.name,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
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
      ),
    );
  }
}
