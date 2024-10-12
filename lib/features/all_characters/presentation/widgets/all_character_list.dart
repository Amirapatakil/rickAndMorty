import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/enums/state_status.dart';
import 'package:rick_and_morty_app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/core/theme/app_dimens.dart';
import 'package:rick_and_morty_app/core/theme/app_textstyle.dart';
import 'package:rick_and_morty_app/core/theme_provider.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/entity/all_character_entity.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/bloc/all_character_bloc.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/bloc/all_character_state.dart';
import 'package:rick_and_morty_app/features/detail_screen/presentation/characters_dateail.dart';

class AllCharacterList extends StatefulWidget {
  const AllCharacterList(
      {super.key,
      required this.character,
      required this.currentPage,
      required this.maxPage,
      required this.searchController});
  final List<CharacterEntity> character;
  final ValueNotifier<int> currentPage;
  final int maxPage;
  final TextEditingController searchController;

  @override
  State<AllCharacterList> createState() => _AllCharacterListState();
}

class _AllCharacterListState extends State<AllCharacterList> {
  final _scrollController = ScrollController();
  bool _isReadyToLoad = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AllCharacterBloc, AllCharacterState>(
      listener: (context, AllCharacterState state) {
        if (state.status == StateStatus.loaded) {
          _isReadyToLoad = true;
        }
      },
      child: NotificationListener(
        onNotification: (notification) {
          if (_scrollController.position.pixels >=
                  _scrollController.position.maxScrollExtent &&
              _isReadyToLoad) {
            widget.currentPage.value++;
            _isReadyToLoad = false;
          }
          return false;
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(
                  childCount: widget.character.length,
                  (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CharactersDateail(
                                    entity: widget.character[index])));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(
                                      widget.character[index].image ?? '',
                                    ))),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.all(AppDimens.mediumPadding),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.character[index].status ?? '',
                                  style: AppTextstyle.s10w500.copyWith(
                                      color: widget.character[index].status ==
                                              'Alive'
                                          ? AppColors.characterAliveStatus
                                          : AppColors.characterDeadStatus),
                                ),
                                SizedBox(
                                  width: 180,
                                  child: Text(
                                      widget.character[index].name ?? '',
                                      style: context
                                          .read<ThemeProvider>()
                                          .currentTheme
                                          .textTheme
                                          .bodySmall),
                                ),
                                Text(
                                  '${widget.character[index].species ?? ''}, ${widget.character[index].gender ?? ''}',
                                  style: AppTextstyle.s12w400
                                      .copyWith(color: AppColors.gender),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                itemExtent: 150)
          ],
        ),
      ),
    );
  }
}
