import 'package:corelab_app_challenge/model/product.dart';
import 'package:corelab_app_challenge/state/categorie_state.dart';
import 'package:corelab_app_challenge/state/screen_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Categorias',
            style: TextStyle(
                fontFamily: 'DMSans',
                color: Color(0xFF002429),
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: const Color(0xFFF7F9FA),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.1),
                  top: BorderSide(color: Colors.grey, width: 0.1),
                ),
              ),
              child: GestureDetector(
                child: ListTile(
                  title: Text(
                    Product.dentalCategories[index],
                    style: const TextStyle(
                        fontFamily: 'DMSans',
                        color: Color(0xFF00B4CC),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                onTap: () {
                  context.read<CategoryState>().selectedCategory =
                      Product.dentalCategories[index];

                  context.read<ScreenState>().setscreen(0);
                },
              ),
            );
          },
          itemCount: Product.dentalCategories.length,
        ));
  }
}
