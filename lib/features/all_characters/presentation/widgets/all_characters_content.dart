import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/extension/context_extension.dart';
import 'package:rick_and_morty_app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/core/theme/app_dimens.dart';
import 'package:rick_and_morty_app/core/theme/app_textstyle.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/entity/all_character_entity.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/widgets/all_character_grid.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/widgets/all_character_list.dart';

import '../../../command/all_character_textfield.dart';

class AllCharactersContent extends StatefulWidget {
  const AllCharactersContent({
    super.key,
    required this.onFilter,
    required this.maxPage,
    required this.count,
    required this.onSearch,
    required this.searchController,
    required this.currentPage,
    required this.characters,
  });
  final void Function()? onFilter;
  final List<CharacterEntity> characters;
  final int maxPage;
  final int count;
  final void Function(String)? onSearch;
  final TextEditingController searchController;
  final ValueNotifier<int> currentPage;

  @override
  State<AllCharactersContent> createState() => _AllCharactersContentState();
}

class _AllCharactersContentState extends State<AllCharactersContent> {
  bool _isGridView = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.mediumPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AllCharacterTextfield(
            searchController: widget.searchController,
            onFilter: widget.onFilter,
            onSearch: widget.onSearch,
          ),
          Row(
            children: [
              SizedBox(
                width: 325,
                child: Text(
                  '${context.lang.allCharacters}: ${widget.count}',
                  style: AppTextstyle.s10w500.copyWith(color: AppColors.uiDark),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isGridView = !_isGridView;
                  });
                },
                icon: Icon(_isGridView ? Icons.list : Icons.grid_view_outlined),
                color: AppColors.uiDark,
              )
            ],
          ),
          Expanded(
              child: _isGridView
                  ? AllCharacterGrid(
                      character: widget.characters,
                      currentPage: widget.currentPage,
                      maxPage: widget.maxPage)
                  : AllCharacterList(
                      character: widget.characters,
                      currentPage: widget.currentPage,
                      maxPage: widget.maxPage,
                      searchController: widget.searchController,
                    )),
        ],
      ),
    );
  }
}
