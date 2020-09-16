import 'package:corona_italy/app/dependencies/dependency_factory.dart';
import 'package:corona_italy/app/dependencies/dependency_provider.dart';
import 'package:corona_italy/app/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CoronaItaly extends StatefulWidget {
  @override
  _CoronaItalyState createState() => _CoronaItalyState();
}

class _CoronaItalyState extends State<CoronaItaly> {
  @override
  Widget build(BuildContext context) {
    return DependencyProvider(
      dependencyFactory: DependencyFactory(),
      child: EasyLocalization(
        supportedLocales: [Locale('en', 'US')],
        fallbackLocale: Locale('en', 'US'),
        path: 'assets/translations',
        child: Builder(
          builder: (context) => MaterialApp(
            themeMode: ThemeMode.system,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Corona Italy',
            onGenerateRoute: (settings) =>
                Routes.onGenerateRoute(settings, context),
          ),
        ),
      ),
    );
  }
}
