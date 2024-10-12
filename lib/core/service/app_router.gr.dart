// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AllCharactersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllCharactersScreen(
          current: 0,
        ),
      );
    }
  };
}

/// generated route for
/// [AllCharactersScreen]
class AllCharactersRoute extends PageRouteInfo<void> {
  const AllCharactersRoute({List<PageRouteInfo>? children})
      : super(
          AllCharactersRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllCharactersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
