import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'partner_reviews_screen.dart';

class PartnerDetailScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image - half height instead of full height
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.5, // 30% of screen height
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover
            ),
          ),
          
          // Main content
          CustomScrollView(
            slivers: [
              // Empty SliverAppBar for spacing and actions
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
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Extra padding at top to account for the logo
                          const SizedBox(height: 64),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            name,
                                            style: const TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'BalooTamma2'
                                            ),
                                          ),
                                          Text(
                                            description,
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
                                
                                // Stag badge
                                if (hasStag) 
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8, left: 0),
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
                                        'Stag',
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'BalooTamma2'
                                        ),
                                      ),
                                    ),
                                  ),
                                
                                const SizedBox(height: 24),
                                _buildInfoRow(Icons.euro, 'Ordine minimo: 10,00 CHF'),
                                const Divider(height: 24, color: Colors.white),
                                _buildInfoRow(
                                  Icons.access_time,
                                  'Aperto alle: 11:30 - 14:30 / 18:30 - 22:30',
                                ),
                                const Divider(height: 24, color: Colors.white),
                                _buildInfoRow(Icons.location_on, 'A 4.5 km da te'),
                                const Divider(height: 24, color: Colors.white),
                                _buildInfoRow(
                                  Icons.pin_drop,
                                  'Piazza Grande 18, CH-6600 Locarno',
                                ),
                                const Divider(height: 24, color: Colors.white),
                                _buildInfoSection(
                                  'Informazioni su "$name"',
                                  'Allergeni e molto altro',
                                  showArrow: true,
                                ),
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
                                        partnerName: name,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                _buildDeliveryInfo(),
                                const SizedBox(height: 24),
                                const Text(
                                  'I più amati',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 136),
                                const Text(
                                  'I più amati',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 136),
                                const Text(
                                  'I più amati',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    Positioned(
                      top: -32, // Position halfway into the header
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
            const Icon(Icons.star, color: AppColors.primary, size: 20)
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
            'Consegna fra ',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const Text('20-30', style: TextStyle(fontWeight: FontWeight.w500)),
          const Text(' min', style: TextStyle(fontWeight: FontWeight.w500)),
          const Spacer(),
          Text(
            'modifica',
            style: TextStyle(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
