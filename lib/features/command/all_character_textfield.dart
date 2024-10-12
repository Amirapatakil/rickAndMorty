import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/extension/context_extension.dart';
import 'package:rick_and_morty_app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/core/theme/app_textstyle.dart';
import 'package:rick_and_morty_app/core/theme_provider.dart';

class AllCharacterTextfield extends StatelessWidget {
  const AllCharacterTextfield(
      {super.key,
      required this.searchController,
      this.onSearch,
      this.onFilter});
  final TextEditingController searchController;
  final void Function(String)? onSearch;
  final void Function()? onFilter;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextstyle.s16w400.copyWith(
          color:
              context.watch<ThemeProvider>().currentTheme.secondaryHeaderColor),
      controller: searchController,
      onChanged: onSearch,
      decoration: InputDecoration(
          filled: true,
          fillColor:
              context.read<ThemeProvider>().currentTheme.secondaryHeaderColor,
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(100)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(100)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(100)),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.uiDark,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 20,
                  width: 1,
                  color: AppColors.uiDark,
                ),
                IconButton(
                  onPressed: onFilter,
                  icon: const Icon(Icons.filter_alt_rounded),
                  color: AppColors.uiDark,
                ),
              ],
            ),
          ),
          hintText: context.lang.findCharacter,
          hintStyle: AppTextstyle.s16w400.copyWith(color: AppColors.uiDark)),
    );
  }
}
