import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rick_and_morty_app/core/extension/app_dimens_extension.dart';
import 'package:rick_and_morty_app/core/extension/context_extension.dart';
import 'package:rick_and_morty_app/core/service/shared_prefs.dart';
import 'package:rick_and_morty_app/core/theme/app_assets.dart';
import 'package:rick_and_morty_app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/core/theme/app_dimens.dart';
import 'package:rick_and_morty_app/core/theme/app_textstyle.dart';
import 'package:rick_and_morty_app/core/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainAuth extends StatefulWidget {
  const MainAuth(
      {super.key, required this.onFIOPressed, required this.onlOGINPressed});
  final void Function()? onFIOPressed;
  final void Function()? onlOGINPressed;

  @override
  State<MainAuth> createState() => _MainAuthState();
}

class _MainAuthState extends State<MainAuth> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  late String firtName = '';
  late String lastName = "";
  late String fatherName = '';
  late String login = '';

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  Future<void> saveImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('image_path', path);
  }

  Future<String?> getImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('image_path');
  }

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
    final mq = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.mediumPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.uiDark,
                  radius: 100,
                  backgroundImage: _image != null
                      ? FileImage(File(_image!.path))
                      : const AssetImage(AppAssets.settingAvatar),
                ),
                AppDimens.mediumPadding.vertical,
                GestureDetector(
                  onTap: () {
                    _pickImage();
                  },
                  child: Text(
                    context.lang.changephoto,
                    style: AppTextstyle.s16w500
                        .copyWith(color: AppColors.filtrSelectedColor),
                  ),
                ),
              ],
            ),
          ),
          AppDimens.bigPadding.vertical,
          Text(
            context.lang.profile,
            style: AppTextstyle.s16w500.copyWith(color: AppColors.uiDark),
          ),
          AppDimens.smallPadding.vertical,
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  width: mq.width / 1.25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context.lang.changename,
                          style: context
                              .read<ThemeProvider>()
                              .currentTheme
                              .textTheme
                              .bodyMedium),
                      Text(
                        ('$firtName $lastName  $fatherName '),
                        style: AppTextstyle.s16w500
                            .copyWith(color: AppColors.uiDark),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: widget.onFIOPressed,
                  icon: const Icon(
                    Icons.navigate_next,
                    color: AppColors.uiDark,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          AppDimens.bigPadding.vertical,
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  width: mq.width / 1.25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context.lang.login,
                          style: context
                              .read<ThemeProvider>()
                              .currentTheme
                              .textTheme
                              .bodyMedium),
                      Text(
                        login,
                        style: AppTextstyle.s16w500
                            .copyWith(color: AppColors.uiDark),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: widget.onlOGINPressed,
                  icon: const Icon(
                    Icons.navigate_next,
                    color: AppColors.uiDark,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
