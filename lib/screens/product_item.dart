import 'package:flutter/material.dart';
import 'package:toko_tokoan/widgets/left_drawer.dart';

class ProductItem {
  final String name;
  final int price;
  final String description;

  ProductItem(this.name, this.price, this.description);
}

class ProductItemPage extends StatelessWidget {
  final ProductItem item;

  const ProductItemPage(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(item.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Theme.of(context).colorScheme.primary,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        drawer: const LeftDrawer(),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "${item.price}",
                ),
                const SizedBox(height: 10),
                Text(
                  item.description,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Go Back'),
                ),
              ],
            )));
  }
}
