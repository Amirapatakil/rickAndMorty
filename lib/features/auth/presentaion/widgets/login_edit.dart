import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/extension/app_dimens_extension.dart';
import 'package:rick_and_morty_app/core/extension/context_extension.dart';
import 'package:rick_and_morty_app/core/service/shared_prefs.dart';
import 'package:rick_and_morty_app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/core/theme/app_dimens.dart';
import 'package:rick_and_morty_app/core/theme/app_textstyle.dart';
import 'package:rick_and_morty_app/core/theme_provider.dart';

class LoginEdit extends StatefulWidget {
  const LoginEdit({super.key, required this.onSave});
  final void Function()? onSave;

  @override
  State<LoginEdit> createState() => _LoginEditState();
}

class _LoginEditState extends State<LoginEdit> {
  final loginController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.mediumPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.lang.login,
              style: context
                  .read<ThemeProvider>()
                  .currentTheme
                  .textTheme
                  .bodyMedium),
          AppDimens.smallPadding.vertical,
          TextField(
            controller: loginController,
            style: AppTextstyle.s16w400.copyWith(color: AppColors.character),
            decoration: InputDecoration(
              fillColor: context
                  .watch<ThemeProvider>()
                  .currentTheme
                  .secondaryHeaderColor,
              filled: true,
              hintText: context.lang.login,
              hintStyle: const TextStyle(color: AppColors.uiDark),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent)),
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
                    SharedPrefs().save(
                        key: PrefsKeys.login, value: loginController.text);
                    widget.onSave?.call();
                  },
                  child: Text(
                    context.lang.save,
                    style: AppTextstyle.s16w400
                        .copyWith(color: AppColors.character),
                  )))
        ],
      ),
    );
  }
}
