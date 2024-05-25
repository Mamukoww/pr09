import 'package:flutter/material.dart';
import 'product_manager.dart';

class ProductInheritedWidget extends InheritedWidget {
  final ProductManager productManager;

  ProductInheritedWidget({
    required this.productManager,
    required Widget child,
  }) : super(child: child);

  static ProductInheritedWidget of(BuildContext context) {
    final ProductInheritedWidget? result = context.dependOnInheritedWidgetOfExactType<ProductInheritedWidget>();
    assert(result != null, 'No ProductInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProductInheritedWidget old) => productManager != old.productManager;
}
