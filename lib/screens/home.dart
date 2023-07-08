import 'package:corelab_app_challenge/fragments/product_fragment.dart';
import 'package:corelab_app_challenge/state/categorie_state.dart';
import 'package:corelab_app_challenge/state/favorites_state.dart';
import 'package:corelab_app_challenge/state/product_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                onChanged: (value) {
                  context.read<CategoryState>().filterList(value);
                },
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          context.read<CategoryState>().refresh();
          return Future.delayed(const Duration(seconds: 1));
        },
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              width: double.infinity,
              color: Colors.grey[200],
              child: context.read<CategoryState>().search == ""
                  ? const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child: Text(
                            'Ultimos anúncios',
                            style: TextStyle(
                                fontFamily: 'DMSans',
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
                                fontFamily: 'DMSans',
                                color: Color(0xFF7C9094),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Text(
                            "${context.watch<CategoryState>().productsFiltered.length} resultados para ${context.watch<CategoryState>().search}",
                            style: const TextStyle(
                                fontFamily: 'DMSans',
                                color: Color(0xFF002429),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  context.read<CategoryState>().refresh();
                  return Future.delayed(const Duration(seconds: 1));
                },
                child: context
                        .watch<CategoryState>()
                        .productsFiltered
                        .isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: ProductFragment.cardProduct(
                              context
                                  .watch<CategoryState>()
                                  .productsFiltered[index],
                              context,
                            ),
                            onTap: () {
                              context.read<ProductState>().setProduct = context
                                  .read<CategoryState>()
                                  .productsFiltered[index]
                                  .id;

                              context.read<FavoritesState>().addFavorite(context
                                  .read<CategoryState>()
                                  .productsFiltered[index]);

                              Navigator.of(context).pushNamed('/productDetail',
                                  arguments: index);
                            },
                          );
                        },
                        itemCount: context
                            .watch<CategoryState>()
                            .productsFiltered
                            .length,
                        scrollDirection: Axis.vertical,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Image.asset(
                              'assets/rafiki.png',
                              fit: BoxFit.cover,
                            ),
                            onTap: () {
                              context.read<CategoryState>().refresh();
                            },
                          ),
                          const Text("Resultado não encontrado",
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                color: Color(0xFF002429),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              )),
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Text(
                                  "Não encontramos nenhum resultado parecido com ${context.read<CategoryState>().search}",
                                  style: const TextStyle(
                                    fontFamily: 'DMSans',
                                    color: Color(0xFF002429),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                        ],
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
