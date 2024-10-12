import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/core/l10n/generated/l10n.dart';
import 'package:rick_and_morty_app/core/localization_provider.dart';
import 'package:rick_and_morty_app/core/service/app_router.dart';
import 'package:rick_and_morty_app/core/service/di.dart' as get_it;
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/core/theme_provider.dart';

GetIt di = GetIt.instance;

void main() {
  get_it.setup(di: di);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LocalizationProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ], child: RickAndMorty()));
}

class RickAndMorty extends StatelessWidget {
  final _appRouter = AppRouter();

  RickAndMorty({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      locale: context.watch<LocalizationProvider>().currentLocale,
      theme: context.watch<ThemeProvider>().currentTheme,
      localizationsDelegates: const [
        L10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.delegate.supportedLocales,
      routerConfig: _appRouter.config(),
    );
  }
}
