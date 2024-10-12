import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/extension/app_dimens_extension.dart';
import 'package:rick_and_morty_app/core/extension/context_extension.dart';
import 'package:rick_and_morty_app/core/service/shared_prefs.dart';
import 'package:rick_and_morty_app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/core/theme/app_dimens.dart';
import 'package:rick_and_morty_app/core/theme/app_textstyle.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/bloc/all_character_bloc.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/bloc/all_character_event.dart';
import 'package:rick_and_morty_app/main.dart';

import '../../../../core/theme_provider.dart';

class FiltrationPage extends StatefulWidget {
  const FiltrationPage({
    super.key,
    required this.save,
  });
  final void Function()? save;

  @override
  State<FiltrationPage> createState() => _FiltrationPageState();
}

class _FiltrationPageState extends State<FiltrationPage> {
  bool isAliveChecked = false;
  bool isDeadChecked = false;
  bool isAliveUnknownChecked = false;
  bool isFGender = false;
  bool ismGender = false;
  bool unknownGender = false;
  bool isSortAZ = false;

  @override
  void initState() {
    super.initState();
    _loadFilters();
  }

  Future<void> _loadFilters() async {
    final filters = await FilterStorage.loadFilters();
    setState(() {
      isAliveChecked = filters['isAliveChecked'] ?? false;
      isDeadChecked = filters['isDeadChecked'] ?? false;
      isAliveUnknownChecked = filters['isUnknownChecked'] ?? false;
      isSortAZ = filters['isSortAZ'] ?? false;
      isFGender = filters['isFemale'] ?? false;
      ismGender = filters['isMale'] ?? false;
      unknownGender = filters['isNone'] ?? false;
    });
  }

  void _saveFilters() {
    FilterStorage.saveFilters(
      isAliveChecked: isAliveChecked,
      isDeadChecked: isDeadChecked,
      isUnknownChecked: isAliveUnknownChecked,
      isSortAZ: isSortAZ,
      isFemale: isFGender,
      isMale: ismGender,
      isNone: unknownGender,
    );
  }

  void _resetFilters() async {
    await FilterStorage.resetFilters();
    setState(() {
      isAliveChecked = false;
      isDeadChecked = false;
      isAliveUnknownChecked = false;
      isSortAZ = false;
      isFGender = false;
      ismGender = false;
      unknownGender = false;
    });
  }

  void _applyFiltersAndSort() {
    final _allcharacterBloc = di<AllCharacterBloc>();

    String statusFilter = '';
    if (isAliveChecked) statusFilter = 'Alive';
    if (isDeadChecked) statusFilter = 'Dead';
    if (isAliveUnknownChecked) statusFilter = 'Unknown';

    String genderFilter = '';
    if (isFGender) genderFilter = 'Female';
    if (ismGender) genderFilter = 'Male';
    if (unknownGender) genderFilter = 'Unknown';

    _allcharacterBloc.add(FilterAndSortCharactersEvent(
      statusFilter: statusFilter,
      genderFilter: genderFilter,
      isSortAZ: isSortAZ,
      page: 1,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.lang.sort,
              style: AppTextstyle.s10w500.copyWith(color: AppColors.uiDark)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.lang.alphabet,
                  style: context
                      .read<ThemeProvider>()
                      .currentTheme
                      .textTheme
                      .bodyMedium),
              IconButton(
                isSelected: isSortAZ,
                selectedIcon: const Icon(
                  Icons.sort_outlined,
                  color: AppColors.filtrSelectedColor,
                ),
                onPressed: () {
                  setState(() {
                    isSortAZ = !isSortAZ;
                    _saveFilters();
                  });
                },
                icon: const Icon(
                  Icons.sort_outlined,
                  color: AppColors.uiDark,
                ),
              ),
            ],
          ),
          const Divider(height: 28, color: AppColors.uiDark),
          Text(
            context.lang.status,
            style: AppTextstyle.s10w500.copyWith(color: AppColors.uiDark),
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              context.lang.alive,
              style: context
                  .read<ThemeProvider>()
                  .currentTheme
                  .textTheme
                  .bodyMedium,
            ),
            value: isAliveChecked,
            onChanged: (bool? value) {
              setState(() {
                isAliveChecked = value ?? false;
                isDeadChecked = false;
                isAliveUnknownChecked = false;
                _saveFilters();
              });
            },
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              context.lang.dead,
              style: context
                  .read<ThemeProvider>()
                  .currentTheme
                  .textTheme
                  .bodyMedium,
            ),
            value: isDeadChecked,
            onChanged: (bool? value) {
              setState(() {
                isDeadChecked = value ?? false;
                isAliveChecked = false;
                isAliveUnknownChecked = false;
                _saveFilters();
              });
            },
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              context.lang.unknowngender,
              style: context
                  .read<ThemeProvider>()
                  .currentTheme
                  .textTheme
                  .bodyMedium,
            ),
            value: isAliveUnknownChecked,
            onChanged: (bool? value) {
              setState(() {
                isAliveUnknownChecked = value ?? false;
                isAliveChecked = false;
                isDeadChecked = false;
                _saveFilters();
              });
            },
          ),
          const Divider(height: 28, color: AppColors.uiDark),
          Text(context.lang.gender,
              style: AppTextstyle.s10w500.copyWith(color: AppColors.uiDark)),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              context.lang.female,
              style: context
                  .read<ThemeProvider>()
                  .currentTheme
                  .textTheme
                  .bodyMedium,
            ),
            value: isFGender,
            onChanged: (bool? value) {
              setState(() {
                isFGender = value ?? false;
                ismGender = false;
                unknownGender = false;
                _saveFilters();
              });
            },
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              context.lang.male,
              style: context
                  .read<ThemeProvider>()
                  .currentTheme
                  .textTheme
                  .bodyMedium,
            ),
            value: ismGender,
            onChanged: (bool? value) {
              setState(() {
                ismGender = value ?? false;
                isFGender = false;
                unknownGender = false;
                _saveFilters();
              });
            },
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              context.lang.unknownstatus,
              style: context
                  .read<ThemeProvider>()
                  .currentTheme
                  .textTheme
                  .bodyMedium,
            ),
            value: unknownGender,
            onChanged: (bool? value) {
              setState(() {
                unknownGender = value ?? false;
                isFGender = false;
                ismGender = false;
                _saveFilters();
              });
            },
          ),
          AppDimens.bigPadding.vertical,
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    widget.save?.call();
                    _applyFiltersAndSort();
                  },
                  child: Text(
                    context.lang.apply,
                    style: AppTextstyle.s16w400
                        .copyWith(color: AppColors.mainDark),
                  ))),
          AppDimens.mediumPadding.vertical,
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    _resetFilters();
                    _applyFiltersAndSort();
                  },
                  child: Text(
                    context.lang.throwoff,
                    style: AppTextstyle.s12w400
                        .copyWith(color: AppColors.characterDeadStatus),
                  )))
        ],
      ),
    );
  }
}
