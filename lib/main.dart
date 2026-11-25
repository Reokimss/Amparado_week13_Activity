
import 'package:flutter/material.dart';

void main() {
  runApp(const CafebaraApp());
}

const Color cream = Color(0xFFFAF5EE);
const Color coffeeBrown = Color(0xFF765139);
const Color darkBrown = Color(0xFF4B3022);
const Color caramel = Color(0xFFC08A61);
const Color leafGreen = Color(0xFF4D6B43);
const Color lightBorder = Color(0xFFEFE3D5);

class CafebaraApp extends StatelessWidget {
  const CafebaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cafebara',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: coffeeBrown,
          surface: cream,
        ),
        fontFamily: 'Roboto',
      ),
      home: const CartScreen(),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,

      // AppBar
      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Your Cozy Cart',
          style: TextStyle(
            color: darkBrown,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Main Content
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                children: const [
                  // Cart Products
                  CartItemCard(
                    name: 'Caramel Macchiato',
                    description: 'Medium, Oat Milk, Extra Shot, Caramel Syrup',
                    price: '₱500',
                    icon: Icons.coffee,
                    imageColor: Color(0xFFB88B65),
                  ),

                  SizedBox(height: 12),

                  CartItemCard(
                    name: 'Warm Butter Croissant',
                    description: 'Freshly Warmed',
                    price: '₱500',
                    icon: Icons.bakery_dining,
                    imageColor: Color(0xFFD6A36D),
                  ),

                  SizedBox(height: 16),

                  // Promo Code
                  PromoCard(),

                  SizedBox(height: 16),

                  // Order Summary
                  OrderSummaryCard(),

                  SizedBox(height: 16),

                  // Payment Method
                  PaymentMethodCard(),

                  SizedBox(height: 12),
                ],
              ),
            ),

            // Checkout Button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
              color: cream,
              child: SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: coffeeBrown,
                    disabledBackgroundColor: coffeeBrown,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Checkout (₱850)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: const CartBottomNavigation(),
    );
  }
}

// Individual Cart Item Widget
class CartItemCard extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final IconData icon;
  final Color imageColor;

  const CartItemCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.icon,
    required this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: lightBorder),
      ),
      child: Row(
        children: [
          // Product Image Placeholder
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: imageColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(
              icon,
              size: 38,
              color: darkBrown,
            ),
          ),

          const SizedBox(width: 12),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: darkBrown,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: coffeeBrown,
                    fontSize: 9,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  price,
                  style: const TextStyle(
                    color: coffeeBrown,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 6),

          // Quantity Controls (Static)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: cream,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Text(
                  '−',
                  style: TextStyle(
                    color: coffeeBrown,
                    fontSize: 13,
                  ),
                ),
                SizedBox(width: 9),
                Text(
                  '1',
                  style: TextStyle(
                    color: darkBrown,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 9),
                Text(
                  '+',
                  style: TextStyle(
                    color: coffeeBrown,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Promo Code Widget
class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: lightBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'COZYBARA',
            style: TextStyle(
              color: coffeeBrown,
              fontSize: 11,
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 17,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: leafGreen,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Text(
              'Applied',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Order Summary Widget
class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: lightBorder),
      ),
      child: const Column(
        children: [
          SummaryRow(
            label: 'Subtotal',
            amount: '₱1,000',
          ),
          SizedBox(height: 10),

          SummaryRow(
            label: 'Promo Discount (20%)',
            amount: '-₱200',
            amountColor: leafGreen,
            labelColor: leafGreen,
          ),
          SizedBox(height: 10),

          SummaryRow(
            label: 'Emissions-Free Delivery',
            amount: '₱50',
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              color: lightBorder,
              height: 1,
            ),
          ),

          SummaryRow(
            label: 'Total Bill',
            amount: '₱850',
            isBold: true,
          ),
        ],
      ),
    );
  }
}

// Reusable Summary Row
class SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isBold;
  final Color labelColor;
  final Color amountColor;

  const SummaryRow({
    super.key,
    required this.label,
    required this.amount,
    this.isBold = false,
    this.labelColor = coffeeBrown,
    this.amountColor = darkBrown,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: labelColor,
            fontSize: isBold ? 12 : 10,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            color: amountColor,
            fontSize: isBold ? 13 : 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// Payment Method Widget
class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: lightBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'PAYMENT METHOD',
            style: TextStyle(
              color: coffeeBrown,
              fontSize: 10,
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 9,
            ),
            decoration: BoxDecoration(
              color: leafGreen,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Text(
              'CASH ON DELIVERY',
              style: TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Bottom Navigation Widget
class CartBottomNavigation extends StatelessWidget {
  const CartBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: lightBorder),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavigationItem(
            icon: Icons.home_outlined,
            label: 'Home',
          ),
          NavigationItem(
            icon: Icons.coffee_outlined,
            label: 'Menu',
          ),
          NavigationItem(
            icon: Icons.shopping_bag_outlined,
            label: 'Cart',
            isSelected: true,
          ),
          NavigationItem(
            icon: Icons.person_outline,
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Individual Navigation Item
class NavigationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const NavigationItem({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color itemColor = isSelected ? coffeeBrown : Colors.grey;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: itemColor,
          size: 21,
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: TextStyle(
            color: itemColor,
            fontSize: 9,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
