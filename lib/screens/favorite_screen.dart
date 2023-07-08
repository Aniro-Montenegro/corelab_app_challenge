import 'package:corelab_app_challenge/fragments/product_fragment.dart';
import 'package:corelab_app_challenge/state/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favoritos',
          style: TextStyle(
              fontFamily: 'DMSans',
              color: Color(0xFF002429),
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color(0xFFF7F9FA),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final product = context.watch<FavoritesState>().favorites[index];

          return Dismissible(
            key: Key(product.id.toString()),
            direction: DismissDirection.startToEnd,
            background: Container(
              color: Colors.red,
              padding: const EdgeInsets.only(left: 16.0),
              alignment: Alignment.centerLeft,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (direction) {
              context.read<FavoritesState>().removeFavorite(product);
            },
            child: ProductFragment.cardProductCart(product, context),
          );
        },
        itemCount: context.watch<FavoritesState>().favorites.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
