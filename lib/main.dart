
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_sun_c10/ui/providers/language_provider.dart';
import 'package:islami_sun_c10/ui/providers/theme_provider.dart';
import 'package:islami_sun_c10/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islami_sun_c10/ui/screens/home/home_screen.dart';
import 'package:islami_sun_c10/ui/screens/splash/splash_screen.dart';
import 'package:islami_sun_c10/ui/screens/sura_details/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_sun_c10/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
       providers: [
         ChangeNotifierProvider (create: (_) => LanguageProvider()),
         ChangeNotifierProvider(create: (_) => ThemeProvider())
       ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of(context);
    ThemeProvider themeProvider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(languageProvider.currentLocale),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentThemeMode,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        SuraDetails.routeName: (_) => const SuraDetails(),
        HadethDetails.routeName: (_) => const HadethDetails()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}

