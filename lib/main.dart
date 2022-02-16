import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fro_meals/presentation/splash/loading_splash_screen.dart';
import 'navigation_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'LY'),
        ],
        path: 'lang',
        child: const FroMealsApp(),
        fallbackLocale: const Locale('en', 'US'),
        startLocale: const Locale('en', 'US'),
      )
  );
}

class FroMealsApp extends StatelessWidget {
  const FroMealsApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: true,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'FroMeal',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color(0xff25ABF5),
          primaryColorLight: const Color(0xff25ABF5),
          accentColor: const Color(0xff99ae7a),
          fontFamily: 'GothamBold',
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 72.0, fontWeight: FontWeight.bold),
            subtitle1: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'GothamBold'),
          ),
          unselectedWidgetColor: Colors.grey[400]
      ),
      home: const LoadingSplashScreen(),
    );
  }
}
