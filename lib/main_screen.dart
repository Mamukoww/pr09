import 'package:flutter/material.dart';
import 'column_screen.dart';
import 'listview_screen.dart';
import 'listview_separated_screen.dart';
import 'product_manager.dart';
import 'product_inherited_widget.dart';
import 'service_locator.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final ProductManager _productManager = getIt<ProductManager>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> get _widgetOptions => <Widget>[
    ColumnScreen(),
    ListViewScreen(),
    ListViewSeparatedScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ProductInheritedWidget(
      productManager: _productManager,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product List'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.view_column),
              label: 'Column',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              label: 'ListView',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              label: 'ListView Separated',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
