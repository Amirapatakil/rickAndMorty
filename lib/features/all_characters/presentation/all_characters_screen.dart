import 'dart:async';
import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/enums/state_status.dart';
import 'package:rick_and_morty_app/core/extension/app_dimens_extension.dart';
import 'package:rick_and_morty_app/core/extension/context_extension.dart';
import 'package:rick_and_morty_app/core/theme/app_assets.dart';
import 'package:rick_and_morty_app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/core/theme/app_dimens.dart';
import 'package:rick_and_morty_app/core/theme/app_textstyle.dart';
import 'package:rick_and_morty_app/core/theme_provider.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/bloc/all_character_bloc.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/bloc/all_character_event.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/bloc/all_character_state.dart';
import 'package:rick_and_morty_app/features/command/all_characters._botomnavbar.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/widgets/all_characters_content.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/widgets/filtration_page.dart';
import 'package:rick_and_morty_app/features/settings_page/presentation/setting_page.dart';
import 'package:rick_and_morty_app/main.dart';

@RoutePage()
class AllCharactersScreen extends StatefulWidget {
  const AllCharactersScreen({super.key, required this.current});
  final int? current;

  @override
  State<AllCharactersScreen> createState() => _AllCharactersScreenState();
}

class _AllCharactersScreenState extends State<AllCharactersScreen> {
  final _allCharacterBloc = di<AllCharacterBloc>()
    ..add(FetchAllCharactersEvent(page: 0));
  Timer? _debounce;
  late TextEditingController _controller;
  final _searchPage = ValueNotifier<int>(0);
  final _currentPage = ValueNotifier<int>(0);

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        _allCharacterBloc.add(FetchAllCharactersEvent(page: 0));
        _searchPage.value = 1;
      } else if (query.isNotEmpty) {
        _allCharacterBloc.add(SearchSingleCharacterEvent(
          name: query,
          page: 0,
        ));
      }
      _currentPage.value = 1;
      log(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndex =
        ValueNotifier<int>(widget.current ?? 0);
    return Scaffold(
      // backgroundColor: AppColors.mainDark,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        // backgroundColor: AppColors.mainDark,
        title: Center(
          child: Text(context.lang.rickAndMorty,
              style: context
                  .read<ThemeProvider>()
                  .currentTheme
                  .textTheme
                  .bodySmall),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (context, index, child) {
            switch (index) {
              case 0:
                return BlocProvider.value(
                    value: _allCharacterBloc,
                    child: BlocBuilder<AllCharacterBloc, AllCharacterState>(
                        builder: (context, state) {
                      if (state.status == StateStatus.loading) {
                        return const Center(
                            child:
                                CircularProgressIndicator()); // Показать индикатор загрузки
                      }
                      if (state.status == StateStatus.loaded) {
                        return AllCharactersContent(
                          onFilter: () {
                            currentIndex.value = 4;
                          },
                          maxPage: state.model?.info?.pages ?? 0,
                          count: state.model?.results?.length.toInt() ?? 0,
                          onSearch: (guery) {
                            _onSearchChanged(guery);
                          },
                          searchController: _controller,
                          currentPage: _currentPage,
                          characters: state.model?.results ?? [],
                        );
                      } else if (state.model?.results == null) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _allCharacterBloc
                                    .add(FetchAllCharactersEvent(page: 0));
                                _controller.clear();
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: AppColors.uiDark,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                      height: 200.0,
                                      width: 200.0,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: ExactAssetImage(
                                                  AppAssets.notFound)))),
                                ),
                                AppDimens.mediumPadding.vertical,
                                Text(
                                  context.lang.cannotSearch,
                                  style: AppTextstyle.s16w500
                                      .copyWith(color: AppColors.uiDark),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return const Text('no data');
                      }
                    }));
              case 4:
                return FiltrationPage(
                  save: () {
                    currentIndex.value = 0;

                    _allCharacterBloc.add(FilterAndSortCharactersEvent(
                      statusFilter: 'Alive',
                      genderFilter: 'Male',
                      isSortAZ: true,
                      page: 1,
                    ));
                  },
                );
              case 1:
                return Center(
                    child: Text(
                  context.lang.location,
                  style:
                      AppTextstyle.s16w500.copyWith(color: AppColors.character),
                ));
              case 2:
                return Center(
                    child: Text(
                  context.lang.episods,
                  style:
                      AppTextstyle.s16w500.copyWith(color: AppColors.character),
                ));
              case 3:
                return const SettingPage();

              default:
                return const Text('Unknown');
            }
          }),
      bottomNavigationBar: BottomNavBar(
        firstLabel: context.lang.characters,
        secondLabel: context.lang.location,
        hirdLabel: context.lang.episods,
        fourthLabel: context.lang.settings,
        onTap: (index) {
          currentIndex.value = index;
        },
      ),
    );
  }
}
