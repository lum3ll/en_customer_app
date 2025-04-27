import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../shared/widgets/custom_nav_bar.dart';
import '../../account/screens/account_screen.dart';
import '../../address/widgets/address_selection_modal.dart';
import '../widgets/category_item.dart';
import '../widgets/partner_card.dart';
import '../widgets/privacy_policy_modal.dart';
import '../widgets/promo_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/tab_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const PrivacyPolicyModal(),
      );
    });
  }

  int _selectedIndex = 0;
  int _selectedTab = 0;
  String _selectedAddress = 'Casa dei nonni'; // Default address

  final List<String> _tabs = [
    'Home',
    'Ristoranti',
    'Spesa',
    'Offerte',
    'Ritiro',
  ];

  void _openAddressSelection() {
    AddressSelectionModal.show(context, (selectedAddress) {
      setState(() {
        _selectedAddress = selectedAddress;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: AppColors.primary),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: _openAddressSelection,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Adesso',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                _selectedAddress,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey[200],
                      child: IconButton(
                        icon: Image.asset(
                          'assets/icons/user.png',
                          width: 24,
                          height: 24,
                        ),
                        onPressed:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AccountScreen(),
                              ),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const CustomSearchBar(),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFE2EDEE),
                      width: 1,
                    ),
                  ),
                ),
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _tabs.length,
                    itemBuilder: (context, index) {
                      return TabItem(
                        label: _tabs[index],
                        isSelected: _selectedTab == index,
                        onTap: () {
                          setState(() {
                            _selectedTab = index;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  children: const [
                    CategoryItem(
                      icon: '🍕',
                      label: 'Pizza',
                      color: Color(0xFFFF8A65),
                    ),
                    CategoryItem(
                      icon: '🍔',
                      label: 'Hamburger',
                      color: Color(0xFFFFB74D),
                    ),
                    CategoryItem(
                      icon: '🍣',
                      label: 'Sushi',
                      color: Color(0xFFFFAB91),
                    ),
                    CategoryItem(
                      icon: '🛒',
                      label: 'Spesa',
                      color: Color(0xFFA5D6A7),
                    ),
                    CategoryItem(
                      icon: '🥪',
                      label: 'Kebab',
                      color: Color(0xFFFFCC80),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: const [
                    PromoCard(
                      title: 'Offerta esclusiva!',
                      subtitle:
                          'Ordina ora e ottieni il 20% di\nsconto sul tuo primo ordine!',
                      code: 'WELCOME 20',
                      color: AppColors.primary,
                    ),
                    PromoCard(
                      title: 'Consegna Gratuita',
                      subtitle: 'Per ordini superiori a 15€',
                      code: 'FREE',
                      color: Color(0xFFFF8A65),
                    ),
                  ],
                ),
              ),
              // After the promo cards section
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'I più amati nella tua zona',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'BalooTamma2',
                          ),
                        ),
                        Text(
                          'I preferiti dagli utenti, vicino a te',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: AppColors.primary,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder:
                      (context, index) => const PartnerCard(
                        imageUrl: 'assets/images/partner_placeholder.jpg',
                        name: 'nome_partner',
                        rating: 4.2,
                        ratingText: 'Molto buono',
                        distance: 4.5,
                        timeRange: '10:00-15:00 / 18:00-23:00',
                        status: 'Aperto',
                        hasStag: true,
                      ),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Offerte nella tua zona',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'BalooTamma2',
                          ),
                        ),
                        Text(
                          'Le offerte vicino a te',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: AppColors.primary,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder:
                      (context, index) => const PartnerCard(
                        imageUrl:
                            'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38',
                        name: 'nome_partner',
                        rating: 4.2,
                        ratingText: 'Molto buono',
                        distance: 4.5,
                        timeRange: '10:00-15:00 / 18:00-23:00',
                        status: 'Aperto',
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
