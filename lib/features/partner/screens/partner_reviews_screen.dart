import 'package:eneed_cust_app/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../shared/widgets/custom_app_bar.dart';

class PartnerReviewsScreen extends StatelessWidget {
  final String partnerName;

  const PartnerReviewsScreen({super.key, required this.partnerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Recensioni'),
      body: Column(
        children: [
          _buildRatingOverview(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Tutte le recensioni',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
          ),
          Divider(height: 1, color: Colors.grey[200]),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildReviewItem(
                  name: 'Matteo R.',
                  date: '12 Gennaio 2025',
                  rating: 5,
                  comment: 'Buono e veloce!',
                ),
                _buildReviewItem(
                  name: 'Bruno D.',
                  date: '12 Gennaio 2025',
                  rating: 5,
                  comment:
                      'Servizio impeccabile! Le consegne sono velocissime e i rider sempre cordiali',
                ),
                _buildReviewItem(
                  name: 'Claudia G.',
                  date: '12 Gennaio 2025',
                  rating: 4,
                  comment: 'Buonissima, però il rider era in ritardo :(',
                ),
                _buildReviewItem(
                  name: 'Martino A.',
                  date: '12 Gennaio 2025',
                  rating: 5,
                  comment: 'Ottimo servizio!',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: "Torna al menu",
                onPressed: Navigator.of(context).pop,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingOverview() {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.white,
      child: Row(
        children: [
          Column(
            children: [
              const Text(
                '4.7',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.w600),
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Più di 500 recensioni',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(width: 32),
          Expanded(
            child: Column(
              children: [
                _buildRatingBar(5, 0.8),
                _buildRatingBar(4, 0.1),
                _buildRatingBar(3, 0.05),
                _buildRatingBar(2, 0.03),
                _buildRatingBar(1, 0.02),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(int rating, double percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            '$rating',
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: percentage,
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primary,
                ),
                minHeight: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem({
    required String name,
    required String date,
    required int rating,
    required String comment,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Text(
                  name[0],
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      date,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz, color: Colors.grey[400]),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      size: 16,
                      color:
                          index < rating ? AppColors.primary : Colors.grey[300],
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(comment),
              ],
            ),
          ),
          Divider(height: 10, color: Colors.grey[200]),
        ],
      ),
    );
  }
}
