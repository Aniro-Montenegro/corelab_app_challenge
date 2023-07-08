import 'package:corelab_app_challenge/fragments/product_fragment.dart';
import 'package:corelab_app_challenge/state/shopping_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCardScreen extends StatelessWidget {
  const ShoppingCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carrinho',
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
          final product = context.watch<ShoppingCartState>().products[index];

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
              context.read<ShoppingCartState>().removeProduct(product);
            },
            child: GestureDetector(
              child: ProductFragment.cardProductCart(product, context),
              onTap: () {},
            ),
          );
        },
        itemCount: context.watch<ShoppingCartState>().products.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
