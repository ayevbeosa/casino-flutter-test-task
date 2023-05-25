import 'package:casino_test/features/characters/presentation/bloc/character_bloc.dart';
import 'package:casino_test/features/characters/presentation/widgets/character_list_item.dart';
import 'package:casino_test/features/characters/presentation/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterList extends StatefulWidget {
  final CharacterState state;
  const CharacterList({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  final _pageController = PageController(viewportFraction: 0.8);
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) {
        bool active = index == _currentIndex;

        return index >= widget.state.characters.length
            ? const Loader()
            : CharacterListItem(
                character: widget.state.characters[index],
                active: active,
              );
      },
      itemCount: widget.state.hasReachedMax
          ? widget.state.characters.length
          : widget.state.characters.length + 1,
      controller: _pageController,
      onPageChanged: (page) {
        setState(() {
          _currentIndex = page;
        });
      },
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
