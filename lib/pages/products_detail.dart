// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:corelab_app_challenge/fragments/product_fragment.dart';
import 'package:corelab_app_challenge/model/product.dart';

import 'package:corelab_app_challenge/state/product_state.dart';
import 'package:corelab_app_challenge/state/shopping_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    Product selectProduct = context.watch<ProductState>().product;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes do Produto',
          style: TextStyle(
              fontFamily: 'DMSans',
              color: Color(0xFF002429),
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color(0xFFF7F9FA),
      ),
      body: Column(children: [
        ExpansionTile(
          title: ProductFragment.cardProduct(
            selectProduct,
            context,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                selectProduct.category,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                selectProduct.description,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'DMSans',
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                if (context.read<ProductState>().product.quantity > 0) {
                  context
                      .read<ProductState>()
                      .removeQuantity(context.read<ProductState>().product.id);
                }
              },
            ),
            SizedBox(
              width: 40,
              child: Text(
                selectProduct.quantity.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                context
                    .read<ProductState>()
                    .addQuantity(context.read<ProductState>().product.id);
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: ElevatedButton(
            onPressed: () {
              context.read<ShoppingCartState>().addProduct(selectProduct);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00B4CC),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text('Adicionar ao Carrinho',
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
          ),
        )
      ]),
    );
  }
}
