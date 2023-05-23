import 'package:casino_test/features/characters/presentation/bloc/character_bloc.dart';
import 'package:casino_test/features/characters/presentation/widgets/character_list_item.dart';
import 'package:casino_test/features/characters/presentation/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final _pageController = PageController(viewportFraction: 0.8);
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: SafeArea(
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            switch (state.status) {
              case CharacterStatus.error:
                return const Center(child: Text('failed to fetch posts'));
              case CharacterStatus.success:
                if (state.characters.isEmpty) {
                  return const Center(child: Text('no posts'));
                }
                return PageView.builder(
                  itemBuilder: (context, index) {
                    bool active = index == _currentIndex;

                    return index >= state.characters.length
                        ? const Loader()
                        : CharacterListItem(
                            character: state.characters[index],
                            active: active,
                          );
                  },
                  itemCount: state.hasReachedMax
                      ? state.characters.length
                      : state.characters.length + 1,
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      _currentIndex = page;
                    });
                  },
                );
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

  @override
  void dispose() {
    _pageController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<CharacterBloc>().add(const GetCharacters());
  }

  bool get _isBottom {
    if (!_pageController.hasClients) return false;
    final maxScroll = _pageController.position.maxScrollExtent;
    final currentScroll = _pageController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
