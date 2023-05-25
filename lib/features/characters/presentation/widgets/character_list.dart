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
  final _scrollController = ScrollController();
  final _showFab = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemBuilder: (context, index) {
            return index >= widget.state.characters.length
                ? widget.state.errorMessage.isEmpty
                    ? const Loader()
                    : const SizedBox()
                : CharacterListItem(
                    character: widget.state.characters[index],
                  );
          },
          itemCount: widget.state.hasReachedMax
              ? widget.state.characters.length
              : widget.state.characters.length + 1,
          controller: _scrollController,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ValueListenableBuilder<bool>(
            valueListenable: _showFab,
            builder: (_, value, __) {
              return Visibility(
                visible: value,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      _scrollController.jumpTo(0.0);
                    },
                    backgroundColor: Colors.grey.shade700,
                    tooltip: 'Go to top',
                    child: const Icon(Icons.arrow_upward),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<CharacterBloc>().add(const GetCharacters());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll > 2.0) {
      _showFab.value = true;
    } else {
      _showFab.value = false;
    }
    return currentScroll >= (maxScroll * 0.9);
  }
}
