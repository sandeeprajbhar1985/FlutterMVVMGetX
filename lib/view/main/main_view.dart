import 'package:flutter/material.dart';
import 'package:mvvm_getx/view/favorite/favorite_view.dart';
import 'package:mvvm_getx/view/home/home_view.dart';
import 'package:rounded_tabbar_widget/rounded_tabbar_widget.dart';
import '../../view/settings/settings_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RoundedTabbarWidget(
        tabIcons: const [
          Icons.home,
          Icons.favorite,
          Icons.settings,
        ],
        pages: const [
          HomeView(),
          FavoriteView(),
          SettingsView(),
        ],
        selectedIndex: 0,
        onTabItemIndexChanged: (int index) {
          print('Index: $index');
        },
      ),
    );
  }
}
