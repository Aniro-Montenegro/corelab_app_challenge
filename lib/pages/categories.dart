import 'package:corelab_app_challenge/model/product.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Categorias',
            style: TextStyle(
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
              child: ListTile(
                title: Text(
                  Product.dentalCategories[index],
                  style: const TextStyle(
                      color: Color(0xFF00B4CC),
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/products');
                },
              ),
            );
          },
          itemCount: Product.dentalCategories.length,
        ));
  }
}
