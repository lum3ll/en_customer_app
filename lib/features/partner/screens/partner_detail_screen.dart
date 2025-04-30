import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../shared/widgets/custom_cart_button.dart';
import 'partner_reviews_screen.dart';

class PartnerDetailScreen extends StatefulWidget {
  final String name;
  final String description;
  final String imageUrl;
  final bool hasStag;

  const PartnerDetailScreen({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
    this.hasStag = false,
  });

  @override
  State<PartnerDetailScreen> createState() => _PartnerDetailScreenState();
}

class _PartnerDetailScreenState extends State<PartnerDetailScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['Pizza in teglia', 'Fritti', 'Dolci', 'Bevande'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.5, // 30% of screen height
            child: Image.asset(
              widget.imageUrl,
              fit: BoxFit.cover
            ),
          ),
          
          // Main content
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 220,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
                elevation: 0,
                leading: _buildCircularButton(
                  'assets/icons/arrow-left.png',
                  onPressed: () => Navigator.pop(context),
                ),
                actions: [
                  _buildCircularButton('assets/icons/heart.png'),
                  _buildCircularButton('assets/icons/arrow-up-from-bracket.png'),
                  _buildCircularButton('assets/icons/magnifying-glass.png'),
                ],
                flexibleSpace: const FlexibleSpaceBar(
                  background: SizedBox(), // Empty background
                ),
              ),
              
              // Content with rounded corners
              SliverToBoxAdapter(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // White content pane with rounded corners
                    Container(
                      // Top rounded corners
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 64),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Partner name and description
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.name,
                                            style: const TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'BalooTamma2'
                                            ),
                                          ),
                                          Text(
                                            widget.description,
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'BalooTamma2'
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                
                                // Tag badge (if present)
                                if (widget.hasStag) 
                                  Padding(
                                    padding: const EdgeInsets.only(top: 24, left: 0, bottom: 12),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.cardBackground,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      child: const Text(
                                        "Tag",
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'BalooTamma2'
                                        ),
                                      ),
                                    ),
                                  ),
                                
                                // Minimum order
                                const SizedBox(height: 24),
                                _buildInfoRow(Icons.receipt, 'Ordine minimo: 10,00 CHF'),
                                
                                // Access time
                                const Divider(height: 24, color: Colors.white),
                                _buildInfoRow(
                                  Icons.access_time,
                                  'Aperto alle: 11:30 - 14:30 / 18:30 - 22:30',
                                ),

                                // Location (if on) and relative distance
                                const Divider(height: 24, color: Colors.white),
                                _buildInfoRow(Icons.near_me_outlined, 'A 4.5 km da te'),

                                // Address complete info
                                const Divider(height: 24, color: Colors.white),
                                _buildInfoRow(
                                  Icons.place_outlined,
                                  'Piazza Grande 18, CH-6600 Locarno',
                                ),

                                // Allergeni and other info
                                const Divider(height: 24, color: Colors.white),
                                _buildInfoSection(
                                  'Informazioni su ${widget.name}',
                                  'Allergeni e molto altro',
                                  showArrow: true,
                                ),

                                // Reviews and rating
                                const SizedBox(height: 16),
                                _buildInfoSection(
                                  '4.5 Molto buono',
                                  'Vedi le 500 recensioni',
                                  showArrow: true,
                                  showStar: true,
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PartnerReviewsScreen(
                                        partnerName: widget.name,
                                      ),
                                    ),
                                  ),
                                ),

                                // Delivery info box
                                const SizedBox(height: 16),
                                _buildDeliveryInfo(),

                                // "I più amati" section
                                const SizedBox(height: 24),
                                _buildMostLovedSection(),

                                // Category tabs
                                const SizedBox(height: 24),
                                Container(
                                  color: Colors.white,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                        _tabs.length,
                                        (index) => _buildTab(_tabs[index], index),
                                      ),
                                    ),
                                  ),
                                ),

                                // Pizza in teglia section
                                _buildPizzaSection(),
                                
                                // Cart button
                                const CustomCartButton(),
                                
                                // Main content
                                // Expanded(
                                //   child: ListView(
                                //     children: [
                                //       // Most loved section
                                //       _buildMostLovedSection(),
                                      
                                //       // Pizza in teglia section
                                //       _buildPizzaSection(),
                                      
                                //       // Cart button
                                //       _buildCartButton(),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Partner image logo half way.
                    Positioned(
                      top: -32,
                      left: 24,
                      child: Container(
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage('assets/images/partner-detail.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularButton(String iconPath, {VoidCallback? onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: IconButton(
          icon: Image.asset(
            iconPath,
            width: 20,
            height: 20,
            color: AppColors.primary,
          ),
          onPressed: onPressed ?? () {},
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection(
    String title,
    String subtitle, {
    bool showArrow = false,
    bool showStar = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          if (showStar)
            const Icon(Icons.star_outline, color: AppColors.primary, size: 20)
          else
            Icon(Icons.info_outline, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ),
          ),
          if (showArrow)
            IconButton(
              icon: Image.asset(
                "assets/icons/arrow-right.png",
                width: 20,
                height: 20,
                color: AppColors.primary,
              ),
              onPressed: () {},
            ),
        ],
      ),
    );
  }

  Widget _buildDeliveryInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(24),
        color: AppColors.cardBackground,
      ),
      child: Row(
        children: [
          Icon(Icons.delivery_dining, color: AppColors.primary),
          const SizedBox(width: 12),
          const Text(
            'Perordina per le ',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          const Text('22', style: TextStyle(fontWeight: FontWeight.w600)),
          const Text(' - 22:30', style: TextStyle(fontWeight: FontWeight.w600)),
          const Spacer(),
          Text(
            'modifica',
            style: TextStyle(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary,
              fontFamily: 'BalooTamma2',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF2FCFD) : Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColors.primary : const Color(0xFFE2EDEE),
              width: isSelected ? 3 : 1,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.primary : Colors.grey,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildMostLovedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16, bottom: 12),
          child: Text(
            'I più amati',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildPizzaItem('Margherita', '9,40 CHF'),
              _buildPizzaItem('Prosciutto cotto e funghi', '9,40 CHF'),
              _buildPizzaItem('Diavola', '9,40 CHF'),
              _buildPizzaItem('Speck e funghi', '9,40 CHF'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPizzaItem(String name, String price) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12, left: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/pizza.jpg',
              width: 120,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF00B2C5),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPizzaSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 24, bottom: 16),
          child: Text(
            'Pizza in teglia',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _buildPizzaDetailItem(
          name: 'Margherita',
          ingredients: 'Pomodoro, mozzarella fiordilatte, basilico',
          price: '9,40 CHF',
          isVegetarian: true,
          isSpicy: true,
        ),
        const Divider(height: 1, indent: 16, endIndent: 16),
        _buildPizzaDetailItem(
          name: 'Porcini e salsiccia',
          ingredients: 'Pomodoro, fiordilatte, funghi porcini, salsiccia',
          price: '9,40 CHF',
          isVegetarian: false,
          isSpicy: false,
          quantity: 2,
        ),
      ],
    );
  }

  Widget _buildPizzaDetailItem({
    required String name,
    required String ingredients,
    required String price,
    required bool isVegetarian,
    required bool isSpicy,
    int? quantity,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pizza image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/pizza.jpg',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          // Pizza details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BalooTamma2',
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (isVegetarian)
                      const Text(
                        '🌱',
                        style: TextStyle(fontSize: 16),
                      ),
                    if (isSpicy)
                      const Text(
                        '🌶️',
                        style: TextStyle(fontSize: 16),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  ingredients,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'BalooTamma2',
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (quantity != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${quantity}x',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          // Price and add button
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF00B2C5),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BalooTamma2',
                ),
              ),
              const SizedBox(height: 16),
              if (quantity != null) ...[
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ] else ...[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
