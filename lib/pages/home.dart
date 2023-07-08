import 'package:corelab_app_challenge/screens/categories_screen.dart';
import 'package:corelab_app_challenge/screens/favorite_screen.dart';
import 'package:corelab_app_challenge/screens/home.dart';
import 'package:corelab_app_challenge/screens/profile_screen.dart';
import 'package:corelab_app_challenge/screens/shopping_card_screen.dart';
import 'package:corelab_app_challenge/state/screen_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexBottom = 0;
  final _screens = [
    const Home(),
    const CategoryScreen(),
    const ShoppingCardScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[context.watch<ScreenState>().indexScreen],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBottom,
          onTap: (index) {
            context.read<ScreenState>().setscreen(index);
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
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Carrinho',
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
