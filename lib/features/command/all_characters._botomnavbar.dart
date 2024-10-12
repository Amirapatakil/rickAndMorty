import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/theme/app_assets.dart';
import 'package:rick_and_morty_app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/core/theme/app_textstyle.dart';
import 'package:rick_and_morty_app/core/theme_provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
    required this.hirdLabel,
    required this.fourthLabel,
    required this.onTap,
  });
  final String firstLabel;
  final String secondLabel;
  final String hirdLabel;
  final String fourthLabel;
  final void Function(int)? onTap;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.05),
        boxShadow: const [],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 50,
        backgroundColor:
            context.watch<ThemeProvider>().currentTheme.dialogBackgroundColor,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                AppAssets.bottomnavabrCharacetrs,
                color: _selectedIndex == 0
                    ? AppColors.characterAliveStatus
                    : AppColors.uiDark,
                colorBlendMode: BlendMode.srcIn,
              ),
              label: widget.firstLabel),
          BottomNavigationBarItem(
              icon: Image.asset(AppAssets.bottomnavabrLocation,
                  color: _selectedIndex == 1
                      ? AppColors.characterAliveStatus
                      : AppColors.uiDark,
                  colorBlendMode: BlendMode.srcIn),
              label: widget.secondLabel),
          BottomNavigationBarItem(
              icon: Image.asset(AppAssets.bottomnavabrEpisodes,
                  color: _selectedIndex == 2
                      ? AppColors.characterAliveStatus
                      : AppColors.uiDark,
                  colorBlendMode: BlendMode.srcIn),
              label: widget.hirdLabel),
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.bottomnavabrSettings,
                color: _selectedIndex == 3
                    ? AppColors.characterAliveStatus
                    : AppColors.uiDark,
                colorBlendMode: BlendMode.srcIn),
            label: widget.fourthLabel,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.characterAliveStatus,
        unselectedItemColor: AppColors.uiDark,
        unselectedLabelStyle:
            AppTextstyle.s12w400.copyWith(color: AppColors.uiDark),
        selectedLabelStyle: AppTextstyle.s12w400
            .copyWith(color: AppColors.characterAliveStatus),
        onTap: _onItemTapped,
      ),
    );
  }
}
