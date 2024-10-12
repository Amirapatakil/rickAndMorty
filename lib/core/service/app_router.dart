import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty_app/features/all_characters/presentation/all_characters_screen.dart';
part 'package:rick_and_morty_app/core/service/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AllCharactersRoute.page, initial: true),
      ];
}
