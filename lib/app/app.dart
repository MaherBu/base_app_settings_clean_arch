import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:service_provider/app/routes/router.dart';
import 'package:service_provider/app/viewmodels/app_viewmodel.dart';
import 'package:service_provider/base/utils/constants.dart';

import '../base/domain/repositories/prefs_repository.dart';

final DateFormat englishDateFormater = DateFormat.yMMMd().add_jm();

class App extends StatefulWidget {
  const App({
    Key? key,
    required this.appViewmodel,
  }) : super(key: key);

  static final GlobalKey<NavigatorState> navKey = GlobalKey(debugLabel: 'Main_ServiceProvider_Navigator');

  final AppViewmodel appViewmodel;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  AppViewmodel get appViewmodel => widget.appViewmodel;
  final PrefsRepository prefs = GetIt.I();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: App.navKey,
      // locale: Locale(appViewmodel.language),
      // initialRoute: SplashPage.route,
      debugShowCheckedModeBanner: false,
      getPages: GetRouter.getPages,
      unknownRoute: GetPage(
        name: RouteNames.NOT_FOUND,
        page: () => const NotFoundScreen(),
      ),
      supportedLocales: const <Locale>[
        Locale(LANGUAGE_ENGLISH),
      ],
      // If you want to make manually change
      // theme: lightTheme(),
      // theme:
      //     SchedulerBinding.instance!.window.platformBrightness == Brightness.dark ? darkTheme() : lightTheme(),
      // localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
      //   // AppLocalizations.delegate,
      //   // GlobalMaterialLocalizations.delegate,
      //   // GlobalWidgetsLocalizations.delegate,
      //   // GlobalCupertinoLocalizations.delegate,
      // ],
      // localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales) {
      //   for (final Locale supportedLocale in supportedLocales) {
      //     if (locale != null && supportedLocale.languageCode == locale.languageCode) {
      //       return supportedLocale;
      //     }
      //   }
      //   return supportedLocales.first;
      // },
    );
  }
}
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Not Found'));
  }
}