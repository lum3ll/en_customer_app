import 'package:eneed_cust_app/features/home/widgets/tab_item.dart';
import 'package:eneed_cust_app/features/order/screens/order_screen.dart';
import 'package:eneed_cust_app/shared/widgets/custom_cart_button.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../shared/widgets/custom_app_bar.dart';

class CartItem {
  final String title;
  final String description;
  final String price;
  int quantity;

  CartItem({
    required this.title,
    required this.description,
    required this.price,
    this.quantity = 1,
  });

  double get priceValue {
    // Convert price string like "9,40 CHF" to double 9.40
    return double.parse(price.replaceAll(',', '.').split(' ')[0]);
  }
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _selectedTab = 0;

  final List<String> _tabs = [
    'Pizza',
    'Fritti',
    'Dolci',
    'Bevande',
  ];

  // Mock cart data
  List<CartItem> _cartItems = [];

  @override
  void initState() {
    super.initState();
    // Initialize with mock data
    _cartItems = [
      CartItem(
        title: 'Margherita 🌱 🌾',
        description: 'Pomodoro, mozzarella fiordilatte, basilico',
        price: '9,40 CHF',
      ),
      CartItem(
        title: 'Porcini e salsiccia 🌶',
        description: 'Pomodoro, mozzarella fiordilatte, funghi porcini, salsiccia',
        price: '9,40 CHF',
        quantity: 2,
      ),
      CartItem(
        title: 'Diavola',
        description: 'Pomodoro, mozzarella fiordilatte, salamino piccante',
        price: '9,40 CHF',
        quantity: 1,
      ),
    ];
  }

  // Calculate total items in cart
  int get totalItems {
    return _cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  // Calculate total price
  double get totalPrice {
    return _cartItems.fold(0.0, (sum, item) => sum + (item.priceValue * item.quantity));
  }

  // Format price to display
  String get formattedTotalPrice {
    return '${totalPrice.toStringAsFixed(2).replaceAll('.', ',')} CHF';
  }

  void _increaseQuantity(int index) {
    setState(() {
      _cartItems[index].quantity++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const CustomAppBar(
        title: "\$nome_partner",
        centerTitle: false,
        actions: [
          Icon(Icons.favorite_outline, color: AppColors.primary),
          SizedBox(width: 8),
          Icon(Icons.ios_share_outlined, color: AppColors.primary),
          SizedBox(width: 8),
          Icon(Icons.search_outlined, color: AppColors.primary)
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: Row(
                children: List.generate(
                  _tabs.length,
                  (index) => Expanded(
                    child: TabItem(
                      label: _tabs[index],
                      isSelected: _selectedTab == index,
                      onTap: () {
                        setState(() {
                          _selectedTab = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: _cartItems.isEmpty
                ? Center(
                    child: Text(
                      'Il tuo carrello è vuoto',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _cartItems.length,
                    itemBuilder: (context, index) {
                      final item = _cartItems[index];
                      return _buildCartItem(
                        item.title,
                        item.description,
                        item.price,
                        index: index,
                        quantity: item.quantity,
                      );
                    },
                  ),
          ),
          if (_cartItems.isNotEmpty)
            _buildBottomBar(context),
        ],
      ),
    );
  }

  Widget _buildCartItem(
    String title,
    String description,
    String price, {
    required int index,
    required int quantity,
  }) {
    return Column(
      children: [
        Container(
          height: 90,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/pizza.jpg',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              
              // Content area with two columns
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left column: Title and Description
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  title,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'BalooTamma2',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            description,
                            style: TextStyle(
                              color: Colors.grey[600], 
                              fontSize: 12,
                              fontFamily: 'BalooTamma2'
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          // Quantity indicator and delete button
                          Row(
                            children: [
                              // Quantity pill
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE0F7F8),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  '${quantity}x',
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              // Delete button
                              GestureDetector(
                                onTap: () => _removeItem(index),
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFE0E0),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    // Right column: Price and Buttons
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            price,
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: AppColors.primary,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  onPressed: () => _decreaseQuantity(index),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  '$quantity',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: AppColors.primary,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  onPressed: () => _increaseQuantity(index),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
          color: Color(0xFFE2EDEE),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        child: CustomCartButton(
          title: 'Vai all\'ordine',
          itemCount: '$totalItems articoli',
          totalPrice: formattedTotalPrice,
          onPressed: () {
            // Navigate to order screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OrderScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
