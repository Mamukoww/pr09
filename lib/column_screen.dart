import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'add_product_screen.dart';
import 'product_detail_screen.dart';
import 'product_inherited_widget.dart';

class ColumnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productManager = ProductInheritedWidget.of(context).productManager;

    return Scaffold(
      appBar: AppBar(
        title: Text('Column Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150.0,
              child: CachedNetworkImage(
                imageUrl: 'https://c1.wallpaperflare.com/preview/997/209/75/retail-grocery-supermarket-store.jpg',
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            ...productManager.products.map((product) {
              return GestureDetector(
                onTap: () {
                  _navigateToProductDetailScreen(context, product);
                },
                child: ListTile(
                  title: Text(product),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      productManager.removeProduct(productManager.products.indexOf(product));
                    },
                  ),
                ),
              );
            }).toList(),
          ],
        ),
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
