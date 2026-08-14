import 'package:built_in_state_management/change_notifier/model/cart_model.dart';
import 'package:built_in_state_management/change_notifier/view/cart_page.dart';
import 'package:built_in_state_management/change_notifier/viewmodel/change_notifier_cart_model.dart';
import 'package:flutter/material.dart';

final _cartItems = [
  CartItem(id: '1', name: 'Wireless Headphones', price: 79.99),
  CartItem(id: '2', name: 'Smart Watch', price: 129.99, quantity: 2),
  CartItem(id: '3', name: 'Phone Case', price: 19.99),
  CartItem(id: '4', name: 'USB-C Cable', price: 9.99, quantity: 3),
  CartItem(id: '5', name: 'Bluetooth Speaker', price: 49.99),
  CartItem(id: '6', name: 'Laptop Stand', price: 34.99),
  CartItem(id: '7', name: 'Mechanical Keyboard', price: 89.99),
  CartItem(id: '8', name: 'Wireless Mouse', price: 24.99, quantity: 2),
  CartItem(id: '9', name: 'Tablet Sleeve', price: 18.99),
  CartItem(id: '10', name: 'Power Bank', price: 39.99),
  CartItem(id: '11', name: 'HDMI Cable', price: 12.99, quantity: 2),
  CartItem(id: '12', name: 'Webcam Cover', price: 5.99, quantity: 4),
  CartItem(id: '13', name: 'Desk Lamp', price: 44.99),
  CartItem(id: '14', name: 'Screen Cleaner', price: 8.99),
  CartItem(id: '15', name: 'Portable SSD', price: 119.99),
  CartItem(id: '16', name: 'MicroSD Card', price: 21.99),
  CartItem(id: '17', name: 'Phone Charger', price: 16.99, quantity: 2),
  CartItem(id: '18', name: 'Laptop Backpack', price: 69.99),
  CartItem(id: '19', name: 'Gaming Controller', price: 59.99),
  CartItem(id: '20', name: 'Monitor Arm', price: 54.99),
  CartItem(id: '21', name: 'Ethernet Cable', price: 7.99, quantity: 3),
  CartItem(id: '22', name: 'USB Hub', price: 29.99),
  CartItem(id: '23', name: 'Noise Cancelling Earbuds', price: 99.99),
  CartItem(id: '24', name: 'Smart Plug', price: 14.99, quantity: 2),
  CartItem(id: '25', name: 'Fitness Tracker', price: 74.99),
  CartItem(id: '26', name: 'Camera Tripod', price: 27.99),
  CartItem(id: '27', name: 'Ring Light', price: 31.99),
  CartItem(id: '28', name: 'Keyboard Wrist Rest', price: 13.99),
  CartItem(id: '29', name: 'Mouse Pad', price: 10.99),
  CartItem(id: '30', name: 'Cable Organizer', price: 6.99, quantity: 5),
  CartItem(id: '31', name: 'Portable Projector', price: 149.99),
  CartItem(id: '32', name: 'VR Headset Strap', price: 22.99),
  CartItem(id: '33', name: 'Smart Home Sensor', price: 17.99, quantity: 2),
  CartItem(id: '34', name: 'Stylus Pen', price: 25.99),
  CartItem(id: '35', name: 'Cooling Pad', price: 28.99),
];

class ChangeNotifierCartItemPage extends StatelessWidget {
  const ChangeNotifierCartItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ChangeNotifierCartModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            actionsPadding: EdgeInsetsDirectional.only(end: 30),
            actions: [
              Badge.count(
                count: ChangeNotifierCartModel().items.length,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                  icon: Icon(Icons.production_quantity_limits_rounded),
                ),
              ),
            ],
          ),
          body: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: _cartItems.length,
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemBuilder: (context, index) => _CartItemTile(
              item: _cartItems[index],
              onTap: () {
                ChangeNotifierCartModel().addItem(_cartItems[index]);
              },
            ),
          ),
        );
      },
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
