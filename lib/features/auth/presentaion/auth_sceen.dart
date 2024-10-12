import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/extension/context_extension.dart';
import 'package:rick_and_morty_app/core/localization_provider.dart';
import 'package:rick_and_morty_app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/core/theme_provider.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/all_characters_screen.dart';
import 'package:rick_and_morty_app/features/auth/presentaion/widgets/login_edit.dart';
import 'package:rick_and_morty_app/features/auth/presentaion/widgets/main_auth.dart';
import 'package:rick_and_morty_app/features/auth/presentaion/widgets/name_edit.dart';

class AuthSceen extends StatefulWidget {
  const AuthSceen({super.key, required this.newLang});
  final Locale newLang;

  @override
  State<AuthSceen> createState() => _AuthSceenState();
}

class _AuthSceenState extends State<AuthSceen> {
  final ValueNotifier<int> authCurrentIndex = ValueNotifier<int>(0);
  Locale? _currentLocale;
  @override
  void initState() {
    super.initState();
    _currentLocale = widget.newLang;
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<LocalizationProvider>().changeLocale(widget.newLang);
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_currentLocale != widget.newLang) {
      _currentLocale = widget.newLang;
      context.read<LocalizationProvider>().changeLocale(_currentLocale!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.lang.EditProfile,
            style: context
                .read<ThemeProvider>()
                .currentTheme
                .textTheme
                .bodyMedium),
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AllCharactersScreen(
                          current: 3,
                        )));
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.uiDark,
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: authCurrentIndex,
        builder: (BuildContext context, index, Widget? child) {
          switch (index) {
            case 0:
              return MainAuth(onFIOPressed: () {
                authCurrentIndex.value = 1;
                log('looog');
              }, onlOGINPressed: () {
                authCurrentIndex.value = 2;
              });
            case 1:
              return NameEdit(
                onSave: () {
                  authCurrentIndex.value = 0;
                },
                newLang: widget.newLang,
              );
            case 2:
              return LoginEdit(
                onSave: () {
                  authCurrentIndex.value = 0;
                },
              );
            default:
              return const Center(
                child: Text('no data'),
              );
          }
        },
      ),
    );
  }
}
