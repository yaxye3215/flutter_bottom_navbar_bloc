import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bottom_navbar_bloc/features/main/bloc/main_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainBloc mainBloc = MainBloc();
  @override
  void initState() {
    super.initState();
    mainBloc.add(ChangeTabBArIndex(index: 0));
  }

  List<Widget> pages = [
    const Center(
      child: Text("HomePage"),
    ),
    const Center(
      child: Text("SearchPage"),
    ),
    const Center(
      child: Text("FavoritesPage"),
    ),
    const Center(
      child: Text("SettingsPage"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      bloc: mainBloc,
      builder: (context, state) {
        int currentIndex = 0;
        if (state is TabBarState) {
          currentIndex = state.index;
        }
        return Scaffold(
          body: pages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.grey,
            currentIndex: currentIndex,
            onTap: (value) {
              mainBloc.add(ChangeTabBArIndex(index: value));
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "favorites"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "settings"),
            ],
          ),
        );
      },
    );
  }
}
