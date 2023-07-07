import 'package:corelab_app_challenge/model/product.dart';
import 'package:flutter/material.dart';

class ProductFragment {
  static Widget cardProduct(Product product, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(product.image,
              height: MediaQuery.of(context).size.height * 0.13,
              width: MediaQuery.of(context).size.width * 0.30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: const TextStyle(
                    color: Color(0xFF002429),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                overflow: TextOverflow.visible,
                maxLines: 1,
                softWrap: false,
              ),
              Text("R\$ ${product.price.toString()}",
                  style: const TextStyle(
                      color: Color(0xFF002429),
                      fontSize: 20,
                      fontWeight: FontWeight.w400)),
              Text(
                product.paymentForm,
                style: const TextStyle(
                    color: Color(0xFF00B4CC),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              const Text(
                "Novo",
                style: TextStyle(
                    color: Color(0xFF7C9094),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
    );
  }
}
