import 'package:built_in_state_management/change_notifier/model/cart_model.dart';
import 'package:flutter/material.dart';

class ChangeNotifierCartModel extends ChangeNotifier {
  ChangeNotifierCartModel._();

  static final ChangeNotifierCartModel _instance = ChangeNotifierCartModel._();
  factory ChangeNotifierCartModel() => _instance;

  final List<CartItem> _items = [];
  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    final index = _items.indexWhere((element) => element.id == item.id);
    if (index >= 0) {
      _items[index].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void claerItems() {
    _items.clear();
    notifyListeners();
  }

  double subTotal() {
    double sub = 0;
    for (var items in _items) {
      sub += items.price;
    }

    return sub;
  }
}
