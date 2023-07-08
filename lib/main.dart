import 'package:corelab_app_challenge/pages/home.dart';
import 'package:corelab_app_challenge/pages/products_detail.dart';
import 'package:corelab_app_challenge/state/categorie_state.dart';
import 'package:corelab_app_challenge/state/favorites_state.dart';
import 'package:corelab_app_challenge/state/product_state.dart';
import 'package:corelab_app_challenge/state/screen_state.dart';
import 'package:corelab_app_challenge/state/shopping_cart_state.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryState()),
        ChangeNotifierProvider(create: (_) => ScreenState()),
        ChangeNotifierProvider(create: (_) => ProductState()),
        ChangeNotifierProvider(create: (_) => ShoppingCartState()),
        ChangeNotifierProvider(create: (_) => FavoritesState())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/productDetail': (context) => const ProductDetail(),
      },
    );
  }
}
