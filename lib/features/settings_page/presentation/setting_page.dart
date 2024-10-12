import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/extension/app_dimens_extension.dart';
import 'package:rick_and_morty_app/core/extension/context_extension.dart';
import 'package:rick_and_morty_app/core/localization_provider.dart';
import 'package:rick_and_morty_app/core/service/shared_prefs.dart';
import 'package:rick_and_morty_app/core/theme/app_assets.dart';
import 'package:rick_and_morty_app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/core/theme/app_dimens.dart';
import 'package:rick_and_morty_app/core/theme/app_textstyle.dart';
import 'package:rick_and_morty_app/core/theme_provider.dart';
import 'package:rick_and_morty_app/features/auth/presentaion/auth_sceen.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late String firtName = "";
  late String lastName = "";
  late String fatherName = '';
  late String login = '';
  late Locale currentLang = const Locale('en');

  Future<void> loadAuth() async {
    firtName = await SharedPrefs().read(key: PrefsKeys.user);
    lastName = await SharedPrefs().read(key: PrefsKeys.lastname);
    fatherName = await SharedPrefs().read(key: PrefsKeys.fathername);
    login = await SharedPrefs().read(key: PrefsKeys.login);
    setState(() {});
    log('$lastName $firtName $fatherName');
  }

  @override
  void initState() {
    loadAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (firtName.isEmpty && lastName.isEmpty && fatherName.isEmpty) {
      setState(() {
        SharedPrefs()
            .save(key: PrefsKeys.user, value: context.lang.unknowngender);
      });
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.mediumPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimens.smallPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(AppAssets.settingAvatar),
                    ),
                    AppDimens.bigPadding.horizontal,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$firtName $lastName $fatherName',
                          style: context
                              .read<ThemeProvider>()
                              .currentTheme
                              .textTheme
                              .bodyMedium,
                        ),
                        AppDimens.smallPadding.vertical,
                        Text(login,
                            style: context
                                .read<ThemeProvider>()
                                .currentTheme
                                .textTheme
                                .bodyMedium),
                      ],
                    ),
                  ],
                ),
                AppDimens.mediumPadding.vertical,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthSceen(
                                      newLang: currentLang,
                                    )));
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          color: AppColors.filtrSelectedColor,
                          width: 1,
                        ),
                        backgroundColor: context
                            .watch<ThemeProvider>()
                            .currentTheme
                            .secondaryHeaderColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        context.lang.edit,
                        style: AppTextstyle.s16w400
                            .copyWith(color: AppColors.filtrSelectedColor),
                      )),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimens.mediumPadding),
            child: Divider(color: AppColors.secondaryDark),
          ),
          Text(
            context.lang.appearance,
            style: AppTextstyle.s12w400.copyWith(color: AppColors.uiDark),
          ),
          AppDimens.mediumPadding.vertical,
          ElevatedButton(
              onPressed: () {
                context.read<ThemeProvider>().changeTheme();
              },
              child: const Text('Change theme')),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    currentLang = const Locale('ky');
                    context
                        .read<LocalizationProvider>()
                        .changeLocale(const Locale('ky'));
                  },
                  child: const Text('kg')),
              ElevatedButton(
                  onPressed: () {
                    currentLang = const Locale('ru');
                    context
                        .read<LocalizationProvider>()
                        .changeLocale(const Locale('ru'));
                  },
                  child: const Text('ru')),
              ElevatedButton(
                  onPressed: () {
                    currentLang = const Locale('en');
                    context
                        .read<LocalizationProvider>()
                        .changeLocale(const Locale('en'));
                  },
                  child: const Text('en')),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimens.mediumPadding),
            child: Divider(color: AppColors.secondaryDark),
          ),
          Text(
            context.lang.about,
            style: AppTextstyle.s12w400.copyWith(color: AppColors.uiDark),
          ),
          AppDimens.smallPadding.vertical,
          Text(context.lang.info,
              style: context
                  .read<ThemeProvider>()
                  .currentTheme
                  .textTheme
                  .bodyMedium),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimens.mediumPadding),
            child: Divider(color: AppColors.secondaryDark),
          ),
          Text(
            context.lang.version,
            style: AppTextstyle.s12w400.copyWith(color: AppColors.uiDark),
          ),
          AppDimens.mediumPadding.vertical,
          Text('Rick & Morty  v1.0.0',
              style: context
                  .read<ThemeProvider>()
                  .currentTheme
                  .textTheme
                  .bodySmall),
        ],
      ),
    );
  }
}
