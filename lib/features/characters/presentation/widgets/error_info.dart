import 'package:casino_test/features/characters/presentation/bloc/character_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorInfo extends StatelessWidget {
  final String errorMessage;

  const ErrorInfo({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          errorMessage,
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: () {
            context.read<CharacterBloc>().add(const GetCharacters());
          },
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
