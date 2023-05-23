import 'package:casino_test/features/characters/presentation/bloc/character_bloc.dart';
import 'package:casino_test/features/characters/presentation/views/characters_screen.dart';
import 'package:casino_test/injection_container.dart' as di;
import 'package:casino_test/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test app',
      home: BlocProvider(
        create: (_) => di.getIt<CharacterBloc>()..add(const GetCharacters()),
        child: const CharactersScreen(),
      ),
    );
  }
}
