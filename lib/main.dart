import 'package:arriada_group01/providers/favorite_provider.dart';
import 'package:arriada_group01/providers/product_provider.dart';
import 'package:arriada_group01/screens/auth_screens/splash_screen.dart';
import 'package:arriada_group01/screens/main_screens/custom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'helpers/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'providers/dark_theme_provider.dart';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  // await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseAuth auth = FirebaseAuth.instance;
  Locale _locale = const Locale('en');
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  // const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return DarkThemeProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return ProductProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return AppProvider();
          },
        )
      ],
      child: ScreenUtilInit(
          designSize: Size(375, 812),
          builder: (BuildContext context, child) => Consumer<DarkThemeProvider>(
                  builder: (context, themeConsumer, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    scaffoldBackgroundColor:
                        themeConsumer.isDark ? Colors.black87 : Colors.white,
                    primarySwatch: Colors.blue,
                    textTheme: GoogleFonts.sourceSans3TextTheme(),
                    progressIndicatorTheme: ProgressIndicatorThemeData(
                      color: mainColor,
                    ),
                    appBarTheme: AppBarTheme(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      iconTheme: IconThemeData(color: mainColor),
                      titleTextStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                  locale: _locale,
                  localizationsDelegates: [
                    AppLocalizations.delegate, // Add this line
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en'), // English
                    Locale('ar'), // Arabic
                  ],
                  localeResolutionCallback: (
                    locale,
                    supportedLocales,
                  ) {
                    return locale;
                  },
                  home: auth.currentUser != null
                      ? NavbarScreen()
                      : SplashScreen(),
                );
              })
          // builder: () {
          //   return MaterialApp(
          //     debugShowCheckedModeBanner: false,
          //     title: 'Flutter Demo',
          //     theme: ThemeData(
          //       scaffoldBackgroundColor: Colors.white,
          //       primarySwatch: Colors.blue,
          //       textTheme: GoogleFonts.cairoTextTheme(),
          //       progressIndicatorTheme: ProgressIndicatorThemeData(
          //         color: mainColor,
          //       ),
          //       appBarTheme: AppBarTheme(
          //         backgroundColor: Colors.white,
          //         elevation: 0,
          //         iconTheme: IconThemeData(color: mainColor),
          //         titleTextStyle: const TextStyle(color: Colors.black),
          //       ),
          //     ),
          //     locale: _locale,
          //     localizationsDelegates: [
          //       AppLocalizations.delegate, // Add this line
          //       GlobalMaterialLocalizations.delegate,
          //       GlobalWidgetsLocalizations.delegate,
          //       GlobalCupertinoLocalizations.delegate,
          //     ],
          //     supportedLocales: const [
          //       Locale('en'), // English
          //       Locale('ar'), // Arabic
          //     ],
          //     localeResolutionCallback: (
          //       locale,
          //       supportedLocales,
          //     ) {
          //       return locale;
          //     },
          //     home: SplashScreen(),
          //   );
          // },
          ),
    );
  }
}
