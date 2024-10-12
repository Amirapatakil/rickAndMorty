import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/enums/state_status.dart';
import 'package:rick_and_morty_app/core/extension/app_dimens_extension.dart';
import 'package:rick_and_morty_app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/core/theme/app_dimens.dart';
import 'package:rick_and_morty_app/core/theme/app_textstyle.dart';
import 'package:rick_and_morty_app/core/theme_provider.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/entity/all_character_entity.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/bloc/all_character_bloc.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/bloc/all_character_state.dart';

class AllCharacterGrid extends StatefulWidget {
  const AllCharacterGrid(
      {super.key,
      required this.character,
      required this.currentPage,
      required this.maxPage});
  final List<CharacterEntity> character;
  final ValueNotifier<int> currentPage;
  final int maxPage;

  @override
  State<AllCharacterGrid> createState() => _AllCharacterGridState();
}

class _AllCharacterGridState extends State<AllCharacterGrid> {
  final _scrollController = ScrollController();
  bool _isReadyToLoad = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AllCharacterBloc, AllCharacterState>(
      listener: (context, state) {
        if (state.status == StateStatus.loaded) {
          _isReadyToLoad = true;
        }
      },
      child: NotificationListener(
        onNotification: (notification) {
          if (_scrollController.position.pixels >=
                  _scrollController.position.maxScrollExtent &&
              _isReadyToLoad &&
              (widget.currentPage.value < widget.maxPage)) {
            log('page ${widget.currentPage.value}');
          }
          return false;
        },
        child: GridView.builder(
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: widget.character.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  log('checked');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: NetworkImage(
                                widget.character[index].image ?? '',
                              ))),
                    ),
                    AppDimens.mediumPadding.vertical,
                    Text(
                      widget.character[index].status ?? '',
                      style: AppTextstyle.s10w500.copyWith(
                          color: widget.character[index].status == 'Alive'
                              ? AppColors.characterAliveStatus
                              : AppColors.characterDeadStatus),
                    ),
                    Text(
                      widget.character[index].name ?? '',
                      style: context
                          .read<ThemeProvider>()
                          .currentTheme
                          .textTheme
                          .bodySmall,
                    ),
                    Text(
                      '${widget.character[index].species ?? ''}, ${widget.character[index].gender ?? ''}',
                      style: AppTextstyle.s12w400
                          .copyWith(color: AppColors.gender),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
