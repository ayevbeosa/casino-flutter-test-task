import 'package:casino_test/features/characters/presentation/bloc/character_bloc.dart';
import 'package:casino_test/features/characters/presentation/widgets/character_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: SafeArea(
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            switch (state.status) {
              case CharacterStatus.error:
                if (state.characters.isNotEmpty) {
                  return CharacterList(state: state);
                }
                return Center(child: Text(state.errorMessage));
              case CharacterStatus.success:
                if (state.characters.isEmpty) {
                  return const Center(child: Text('No one is home'));
                }
                return CharacterList(state: state);
              case CharacterStatus.initial:
                return const Center(child: CircularProgressIndicator());
              case CharacterStatus.loading:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
