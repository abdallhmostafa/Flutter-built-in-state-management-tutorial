import 'package:built_in_state_management/change_notifier/model/cart_model.dart';
import 'package:built_in_state_management/change_notifier/viewmodel/change_notifier_cart_model.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListenableBuilder(
        listenable: ChangeNotifierCartModel(),
        builder: (context, child) {
          final sub = ChangeNotifierCartModel().subTotal();

          return Column(
            children: [
              Text("Items"),
              Expanded(
                flex: 2,
                child: ListView.builder(
                  itemCount: ChangeNotifierCartModel().items.length,
                  itemBuilder: (context, index) {
                    return _CartItemTile(
                      item: ChangeNotifierCartModel().items[index],
                      onTap: () {
                        ChangeNotifierCartModel().removeItem(
                          ChangeNotifierCartModel().items[index].id,
                        );
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Subtotal',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        '\$$sub',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const ListTile(
                      title: Text('Shipping'),
                      trailing: Text('\$12.00'),
                    ),
                    ListTile(
                      title: Text('Total', style: TextStyle(fontSize: 20)),
                      trailing: Text(
                        '\$${12 + sub}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const FilledButton(
                      onPressed: null,
                      child: Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CartItemTile extends StatelessWidget {
  const _CartItemTile({required this.item, required this.onTap});

  final CartItem item;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.shopping_bag_outlined),
        title: Text(item.name),
        subtitle: Text('Quantity: ${item.quantity}'),
        trailing: Text('\$${item.price}'),
        onTap: onTap,
      ),
    );
  }
}
