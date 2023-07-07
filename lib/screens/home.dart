import 'package:corelab_app_challenge/fragments/product_fragment.dart';
import 'package:corelab_app_challenge/model/product.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00B4CC),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.06,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF00B4CC),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onTap: () {
                  showSearch(context: context, delegate: Searchproducts());
                },
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.13,
            width: double.infinity,
            color: Colors.grey[200],
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    'Ultimos anúncios',
                    style: TextStyle(
                        color: Color(0xFF002429),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    'Hoje',
                    style: TextStyle(
                        color: Color(0xFF7C9094),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ProductFragment.cardProduct(
                    Product.products[index], context);
              },
              itemCount: Product.products.length,
              scrollDirection: Axis.vertical,
            ),
          )
        ],
      ),
    );
  }
}

class Searchproducts extends SearchDelegate {
  List<Product> products = Product.products;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> results = products
        .where((element) =>
            (element.name.toLowerCase().contains(query.toLowerCase())) ||
            (element.description.toLowerCase().contains(query.toLowerCase())) ||
            (element.category.toLowerCase().contains(query.toLowerCase())))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ProductFragment.cardProduct(results[index], context);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> results = products
        .where((element) =>
            (element.name.toLowerCase().contains(query.toLowerCase())) ||
            (element.description.toLowerCase().contains(query.toLowerCase())) ||
            (element.category.toLowerCase().contains(query.toLowerCase())))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ProductFragment.cardProduct(results[index], context);
      },
    );
  }
}
