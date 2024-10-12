import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/extension/app_dimens_extension.dart';
import 'package:rick_and_morty_app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/core/theme/app_dimens.dart';
import 'package:rick_and_morty_app/core/theme/app_textstyle.dart';
import 'package:rick_and_morty_app/features/all_characters/domain/entity/all_character_entity.dart';
import 'package:rick_and_morty_app/features/detail_screen/presentation/widgets/characetr_detail_avatar.dart';

class CharactersDateail extends StatelessWidget {
  const CharactersDateail({super.key, required this.entity});
  final CharacterEntity entity;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        CharacetrDetailAvatar(
          image: entity.image ?? '',
        ),
        Text(
          entity.name ?? '',
          style: AppTextstyle.s34w400.copyWith(color: AppColors.character),
        ),
        Text(
          entity.status ?? '',
          style: AppTextstyle.s16w400.copyWith(
              color: entity.status == "Alive"
                  ? AppColors.characterAliveStatus
                  : AppColors.characterDeadStatus),
        ),
        AppDimens.mediumPadding.vertical,
        Column(
          children: [
            SizedBox(
              width: mq.width / 1.2,
              height: mq.height / 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: AppTextstyle.s12w400
                            .copyWith(color: AppColors.uiDark),
                      ),
                      AppDimens.smallPadding.vertical,
                      Text(
                        entity.gender ?? '',
                        style: AppTextstyle.s12w400
                            .copyWith(color: AppColors.character),
                      ),
                    ],
                  ),
                  AppDimens.deatailScreePaddinf.horizontal,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Species',
                        style: AppTextstyle.s12w400
                            .copyWith(color: AppColors.uiDark),
                      ),
                      AppDimens.smallPadding.vertical,
                      Text(
                        entity.species ?? '',
                        style: AppTextstyle.s12w400
                            .copyWith(color: AppColors.character),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}
