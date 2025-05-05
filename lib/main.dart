/*
congress_fahrplan
This is the dart file containing the main method, the ThemeWrapper and the CongressFahrplanApp class.
SPDX-License-Identifier: GPL-2.0-only
Copyright (C) 2019 -2021 Benjamin Schilling
*/

import 'package:congress_fahrplan/model/fahrplan.dart';
import 'package:congress_fahrplan/provider/favorite_provider.dart';
import 'package:congress_fahrplan/widgets/all_talks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ThemeWrapper());
}

class FahrplanColors {
  static Color baseBlack() {
    return const Color(0xff000000);
  }

  static Color baseWhite() {
    return const Color(0xffffffff);
  }

  static Color baseGreyLight() {
    return const Color(0xffd9d9d9);
  }

  static Color baseGreyMedium() {
    return const Color(0xffaaaaaa);
  }

  static Color baseMediumDarkGrey() {
    return const Color(0xff7a7a7a);
  }

  static Color baseDarkGrey() {
    return const Color(0xff202020);
  }

  static Color primaryAccentLightBlue() {
    return const Color(0xff2d42ff);
  }

  static Color primaryAccentDarkBlue() {
    return const Color(0xff0b1575);
  }

  static Color primaryAccentLightRed() {
    return const Color(0xffde4040);
  }

  static Color primaryAccentDarkRed() {
    return const Color(0xff561010);
  }

  static Color primaryAccentLightGreen() {
    return const Color(0xff79ff5e);
  }

  static Color primaryAccentDarkGreen() {
    return const Color(0xff2b8d18);
  }

  static Color secondaryAccentLightTurquoise() {
    return const Color(0xff29ffff);
  }

  static Color secondaryAccentDarkTurquoise() {
    return const Color(0xff006b6b);
  }

  static Color secondaryAccentLightPurple() {
    return const Color(0xffde37ff);
  }

  static Color secondaryAccentDarkPurple() {
    return const Color(0xff66007a);
  }

  static Color secondaryAccentLightYellow() {
    return const Color(0xfff6f675);
  }

  static Color secondaryAccentDarkYellow() {
    return const Color(0xff757501);
  }
}

class ThemeWrapper extends StatelessWidget {
  const ThemeWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Congress Fahrplan',
      theme: ThemeData(
        fontFamily: 'VcrOcdFaux',
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          surface: FahrplanColors.baseBlack(),
          brightness: Brightness.dark,
          primary: FahrplanColors.baseWhite(),
        ),
        tabBarTheme: const TabBarTheme(
          indicator: UnderlineTabIndicator(),
        ),
        primaryColor: FahrplanColors.baseWhite(),
        primaryColorLight: FahrplanColors.baseWhite(),
        primaryColorDark: FahrplanColors.baseBlack(),
        indicatorColor: FahrplanColors.primaryAccentLightBlue(),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: FahrplanColors.baseWhite(),
          ),
          bodyMedium: TextStyle(
            color: FahrplanColors.baseWhite(),
          ),
          bodyLarge: TextStyle(
            color: FahrplanColors.baseWhite(),
          ),
          titleSmall: TextStyle(
            color: FahrplanColors.baseWhite(),
          ),
          titleMedium: TextStyle(
            color: FahrplanColors.baseWhite(),
          ),
          headlineMedium: TextStyle(
            color: FahrplanColors.baseWhite(),
          ),
          bodySmall: TextStyle(
            color: FahrplanColors.baseWhite(),
          ),
          labelSmall: TextStyle(
            color: FahrplanColors.baseWhite(),
          ),
          headlineSmall: TextStyle(
            color: FahrplanColors.baseWhite(),
          ),
        ),
        cardTheme: CardTheme(
          color: FahrplanColors.baseBlack(),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              width: 2.0,
              color: FahrplanColors.primaryAccentDarkBlue(),
            ),
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: FahrplanColors.baseBlack(),
          actionTextColor: FahrplanColors.primaryAccentLightGreen(),
          contentTextStyle: TextStyle(
            color: FahrplanColors.primaryAccentLightGreen(),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(0)),
              side: BorderSide(
                  width: 2.0, color: FahrplanColors.primaryAccentDarkGreen())),
          elevation: 30,
        ),
        appBarTheme: AppBarTheme(
          color: FahrplanColors.baseBlack(),
          iconTheme: IconThemeData(
            color: FahrplanColors.primaryAccentLightBlue(),
          ),
        ),
        iconTheme: IconThemeData(
          color: FahrplanColors.primaryAccentLightBlue(),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return FahrplanColors.primaryAccentLightBlue();
              }
              return null;
            },
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return null;
              }
              if (states.contains(WidgetState.selected)) {
                return FahrplanColors.primaryAccentLightBlue();
              }
              return null;
            },
          ),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            if (states.contains(WidgetState.selected)) {
              return FahrplanColors.primaryAccentLightBlue();
            }
            return null;
          }),
          trackColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            if (states.contains(WidgetState.selected)) {
              return FahrplanColors.primaryAccentLightBlue();
            }
            return null;
          }),
        ),
        dialogTheme:
            DialogThemeData(backgroundColor: FahrplanColors.baseBlack()),
      ),
      home: CongressFahrplanApp(key: key),
    );
  }
}

class CongressFahrplanApp extends StatelessWidget {
  const CongressFahrplanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: Consumer<FavoriteProvider>(
        builder: (context, favoriteProvider, child) => FutureBuilder<Fahrplan>(
          future: favoriteProvider.futureFahrplan,
          builder: (context, AsyncSnapshot<Fahrplan> snapshot) {
            if (snapshot.hasData) {
              favoriteProvider.initializeProvider(snapshot.data!);
              if (favoriteProvider.fahrplan!.fetchState ==
                  FahrplanFetchState.successful) {
                return AllTalks(
                  theme: Theme.of(context),
                );
              } else {
                return SafeArea(
                  child: Scaffold(
                    backgroundColor: FahrplanColors.baseBlack(),
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/icon.png'),
                        const Text(
                          'Could not fetch Fahrplan!',
                        ),
                        Text(
                          favoriteProvider.fahrplan!.fetchMessage!,
                        ),
                      ],
                    ),
                  ),
                );
              }
            } else {
              return SafeArea(
                child: Scaffold(
                  backgroundColor: FahrplanColors.baseBlack(),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
                          child: Image.asset('assets/icon.png')),
                      const CircularProgressIndicator(),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: const Text('Fetching Fahrplan'),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
