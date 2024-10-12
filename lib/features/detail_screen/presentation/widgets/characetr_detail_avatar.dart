import 'dart:developer';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/service/app_router.dart';
import 'package:rick_and_morty_app/core/theme_provider.dart';

class CharacetrDetailAvatar extends StatelessWidget {
  const CharacetrDetailAvatar({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SizedBox(
      height: mq.height / 4 + mq.height / 8,
      child: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 3,
              sigmaY: 3,
            ),
            child: Container(
              height: mq.height / 4,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.grey.shade900,
                    Colors.grey.shade900,
                    Colors.grey.shade900,
                    Colors.grey.shade900,
                  ],
                ),
                boxShadow: [],
                image: DecorationImage(
                  opacity: 0.8,
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: GestureDetector(
              onTap: () {
                log('jjjj');
                context.router.push(const AllCharactersRoute());
              },
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
                width: mq.width / 4,
                height: mq.height / 4,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 8,
                        color: context
                            .read<ThemeProvider>()
                            .currentTheme
                            .scaffoldBackgroundColor),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(image),
                    ))),
          )
        ],
      ),
    );
  }
}
