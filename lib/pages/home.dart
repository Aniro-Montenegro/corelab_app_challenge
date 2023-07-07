import 'package:corelab_app_challenge/pages/categories.dart';
import 'package:corelab_app_challenge/screens/home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexBottom = 0;
  final _screens = [
    const Home(),
    const CategoryPage(),
    const Home(),
    const CategoryPage(),
    const Home(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[indexBottom],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBottom,
          onTap: (index) {
            setState(() {
              indexBottom = index;
            });
          },
          selectedItemColor: const Color(0xFF00B4CC),
          unselectedItemColor: const Color(0xFF7C9094),
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'Anunciar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Conta',
            ),
          ]),
    );
  }
}

navigationRoutes(int index) {
  switch (index) {
    case 0:
      return '/home';
    case 1:
      return '/categories';
    default:
      return '/home';
  }
}
