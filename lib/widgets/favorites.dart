/*
congress_fahrplan
This is the dart file containing the Favorites screen StatelessWidget
SPDX-License-Identifier: GPL-2.0-only
Copyright (C) 2019 - 2021 Benjamin Schilling
*/

import 'package:congress_fahrplan/provider/favorite_provider.dart';
import 'package:congress_fahrplan/widgets/fahrplan_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    // The StoreProvider should wrap your MaterialApp or WidgetsApp. This will
    // ensure all routes have access to the store.
    var favorites = Provider.of<FavoriteProvider>(context);
    return MaterialApp(
      theme: Theme.of(context),
      title: favorites.fahrplan!.getFahrplanTitle(),
      home: DefaultTabController(
        length: favorites.fahrplan!.days!.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(favorites.fahrplan!.getFavoritesTitle()),
            bottom: TabBar(
              tabs: favorites.fahrplan!.conference!.getDaysAsText(),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Theme.of(context).TabBarThemeData.indicatorColor,
                ),
              ),
            ),
          ),
          drawer: const FahrplanDrawer(title: 'Favorites'),
          body: TabBarView(children: favorites.fahrplan!.buildFavoriteList()),
        ),
      ),
    );
  }
}
