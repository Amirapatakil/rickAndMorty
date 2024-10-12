import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/extension/app_dimens_extension.dart';
import 'package:rick_and_morty_app/core/extension/context_extension.dart';
import 'package:rick_and_morty_app/core/service/shared_prefs.dart';
import 'package:rick_and_morty_app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/core/theme/app_dimens.dart';
import 'package:rick_and_morty_app/core/theme/app_textstyle.dart';
import 'package:rick_and_morty_app/core/theme_provider.dart';

class NameEdit extends StatefulWidget {
  const NameEdit({super.key, required this.onSave, required this.newLang});
  final void Function()? onSave;
  final Locale newLang;
  @override
  State<NameEdit> createState() => _NameEditState();
}

class _NameEditState extends State<NameEdit> {
  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();
    final lastNamecontroller = TextEditingController();
    final fatherNamecontroller = TextEditingController();
    final key = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.all(AppDimens.mediumPadding),
      child: Form(
        key: key,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.lang.name,
                    style: context
                        .read<ThemeProvider>()
                        .currentTheme
                        .textTheme
                        .bodyMedium),
                AppDimens.smallPadding.vertical,
                TextFormField(
                  controller: namecontroller,
                  style:
                      AppTextstyle.s16w400.copyWith(color: AppColors.character),
                  decoration: InputDecoration(
                    fillColor: context
                        .watch<ThemeProvider>()
                        .currentTheme
                        .secondaryHeaderColor,
                    filled: true,
                    hintText: context.lang.name,
                    hintStyle: const TextStyle(color: AppColors.uiDark),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                  ),
                ),
                AppDimens.mediumPadding.vertical,
                Text(context.lang.lastname,
                    style: context
                        .read<ThemeProvider>()
                        .currentTheme
                        .textTheme
                        .bodyMedium),
                AppDimens.smallPadding.vertical,
                TextFormField(
                  controller: lastNamecontroller,
                  style:
                      AppTextstyle.s16w400.copyWith(color: AppColors.character),
                  decoration: InputDecoration(
                    fillColor: context
                        .watch<ThemeProvider>()
                        .currentTheme
                        .secondaryHeaderColor,
                    filled: true,
                    hintText: context.lang.lastname,
                    hintStyle: const TextStyle(color: AppColors.uiDark),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                  ),
                ),
                AppDimens.mediumPadding.vertical,
                Text(context.lang.fathername,
                    style: context
                        .read<ThemeProvider>()
                        .currentTheme
                        .textTheme
                        .bodyMedium),
                AppDimens.smallPadding.vertical,
                TextFormField(
                  controller: fatherNamecontroller,
                  style:
                      AppTextstyle.s16w400.copyWith(color: AppColors.character),
                  decoration: InputDecoration(
                    fillColor: context
                        .watch<ThemeProvider>()
                        .currentTheme
                        .secondaryHeaderColor,
                    filled: true,
                    hintText: context.lang.fathername,
                    hintStyle: const TextStyle(color: AppColors.uiDark),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                  ),
                ),
                AppDimens.bigPadding.vertical,
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            color: AppColors.filtrSelectedColor,
                            width: 1,
                          ),
                          backgroundColor: AppColors.filtrSelectedColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (namecontroller.text.isNotEmpty) {
                            SharedPrefs().save(
                                key: PrefsKeys.user,
                                value: namecontroller.text);
                          }

                          if (lastNamecontroller.text.isNotEmpty) {
                            SharedPrefs().save(
                                key: PrefsKeys.lastname,
                                value: lastNamecontroller.text);
                          }

                          if (fatherNamecontroller.text.isNotEmpty) {
                            SharedPrefs().save(
                                key: PrefsKeys.fathername,
                                value: fatherNamecontroller.text);
                          }

                          widget.onSave?.call();
                        },
                        child: Text(
                          context.lang.save,
                          style: AppTextstyle.s16w400
                              .copyWith(color: AppColors.character),
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
