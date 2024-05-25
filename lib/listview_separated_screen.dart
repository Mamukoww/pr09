import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'add_product_screen.dart';
import 'product_detail_screen.dart';
import 'product_inherited_widget.dart';

class ListViewSeparatedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productManager = ProductInheritedWidget.of(context).productManager;

    return Scaffold(
      appBar: AppBar(
        title: Text('ListView.separated Screen'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150.0,
            child: CachedNetworkImage(
              imageUrl: 'https://c1.wallpaperflare.com/preview/681/733/160/food-aisle-store-chips.jpg',
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: productManager.products.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _navigateToProductDetailScreen(context, productManager.products[index]);
                  },
                  child: ListTile(
                    title: Text(productManager.products[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        productManager.removeProduct(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddProductScreen(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _navigateToAddProductScreen(BuildContext context) async {
    final newProduct = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProductScreen()),
    );
    if (newProduct != null) {
      ProductInheritedWidget.of(context).productManager.addProduct(newProduct);
    }
  }

  void _navigateToProductDetailScreen(BuildContext context, String productName) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductDetailScreen(productName: productName)),
    );
  }
}
