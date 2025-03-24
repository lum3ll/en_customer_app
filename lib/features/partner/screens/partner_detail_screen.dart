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
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: Colors.transparent,
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
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(imageUrl, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -32),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 48, 24, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      description,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                    if (hasStag) const SizedBox(height: 8),
                                    if (hasStag)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary.withOpacity(
                                            0.1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        child: const Text(
                                          'Stag',
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
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
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => PartnerReviewsScreen(
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
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularButton(String iconPath, {VoidCallback? onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
