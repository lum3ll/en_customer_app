import 'package:eneed_cust_app/features/payment/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../shared/widgets/custom_app_bar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // Delivery options
  bool _isDeliveryNow = true;
  bool _showDeliveryOptions = false;
  
  // Tip amount
  double _tipAmount = 2.50;
  
  // Discount code
  final TextEditingController _discountController = TextEditingController();
  
  @override
  void dispose() {
    _discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const CustomAppBar(
        title: "Il tuo ordine",
        centerTitle: true,
        actions: [
          Icon(Icons.headset_mic_outlined, color: AppColors.primary),
          SizedBox(width: 16),
        ],
      ),
      body: Stack(
        children: [
          // Main content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Delivery section
                _buildSectionTitle('Consegna, quando e come'),
                _buildDeliveryOption(),
                
                // Minimum order
                _buildMinimumOrder(),
                
                // Cart items
                _buildSectionTitle('Carrello'),
                _buildCartItems(),
                
                // Discount code section
                _buildSectionTitle('Hai un codice sconto?'),
                _buildDiscountSection(),
                
                // Rider tip section
                _buildSectionTitle('Ringrazia il rider'),
                _buildRiderTipSection(),
                
                // Service fees
                _buildSectionTitle('Spese'),
                _buildServiceFees(),
                
                // Note section
                _buildSectionTitle('Note'),
                _buildNoteSection(),
                
                // Support section
                _buildSupportSection(),
                
                // Cancel order button
                _buildCancelOrderButton(),
                
                // Space for the bottom button
                const SizedBox(height: 160),
              ],
            ),
          ),
          
          // Delivery options modal
          // if (_showDeliveryOptions)
          //   _buildDeliveryOptionsModal(),
          
          // Bottom area with total and payment button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Total order section
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Totale dell\'ordine',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'BalooTamma2',
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '31,75 CHF',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'BalooTamma2',
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                // Payment button
                _buildPaymentButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'BalooTamma2',
        ),
      ),
    );
  }

  Widget _buildDeliveryOption() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showDeliveryOptions = true;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/rider.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Consegna con rider',
                    style: TextStyle(
                      fontFamily: 'BalooTamma2',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'fra 20-30 min',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontFamily: 'BalooTamma2',
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'modifica',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMinimumOrder() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0F7F8)),
      ),
      child: Row(
        children: [
          Icon(Icons.receipt, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          const Text(
            'Ordine minimo',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'BalooTamma2',
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '10,00 CHF',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontFamily: 'BalooTamma2',
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItems() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Porcini e salsiccia
          _buildCartItem(
            'Porcini e salsiccia',
            2,
            '18,80 CHF',
          ),
          const Divider(height: 24),
          // Diavola
          _buildCartItem(
            'Diavola',
            1,
            '9,40 CHF',
          ),
          const Divider(height: 24),
          // Subtotal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Subtotale',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'BalooTamma2',
                  fontSize: 16,
                ),
              ),
              Text(
                '28,20 CHF',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'BalooTamma2',
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(String name, int quantity, String price) {
    return Row(
      children: [
        Icon(Icons.delete_outline, color: Colors.red[300], size: 20),
        const SizedBox(width: 12),
        Text(
          '${quantity}x',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'BalooTamma2',
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'BalooTamma2',
            ),
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'BalooTamma2',
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            // Decrease quantity
          },
          child: Container(
            padding: const EdgeInsets.all(4),
            child: const Icon(Icons.remove, size: 18, color: AppColors.primary),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            // Increase quantity
          },
          child: Container(
            padding: const EdgeInsets.all(4),
            child: const Icon(Icons.add, size: 18, color: AppColors.primary),
          ),
        ),
      ],
    );
  }

  Widget _buildDiscountSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Inseriscilo qui sotto e risparmia sul tuo ordine!',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _discountController,
            decoration: InputDecoration(
              hintText: 'Inserisci un codice sconto',
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Apply discount code
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: BorderSide(color: AppColors.primary),
                ),
              ),
              child: const Text(
                'Applica il codice',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRiderTipSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Mancia per il rider',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Text(
                '${_tipAmount.toStringAsFixed(2).replaceAll('.', ',')} CHF',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_tipAmount > 0.5) {
                      _tipAmount -= 0.5;
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.remove, size: 16),
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _tipAmount += 0.5;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, size: 16, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Lasciare una mancia al rider è un modo per mostrare apprezzamento per il loro impegno!',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Affrontano traffico e meteo per consegnarti il tuo ordine puntualmente. Un piccolo gesto può fare una grande differenza!',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceFees() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Spese di servizio',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'BalooTamma2',
              fontSize: 16,
            ),
          ),
          Text(
            '1,05 CHF',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'BalooTamma2',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: TextField(
        maxLines: 5,
        decoration: InputDecoration(
          hintText: 'Inserisci una nota per il tuo ordine',
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
            fontFamily: 'BalooTamma2',
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16)
        ),
      ),
    );
  }

  Widget _buildSupportSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hai bisogno di aiuto con il tuo ordine?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'BalooTamma2',
            ),
          ),
          const SizedBox(height: 16),
          // Chat with operator button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Chat with operator action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text(
                'Chatta con un nostro operatore',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'BalooTamma2',
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Request assistance button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Request assistance action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                  side: BorderSide(color: AppColors.primary),
                ),
              ),
              child: const Text(
                'Invia una richiesta di assistenza',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'BalooTamma2',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCancelOrderButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: TextButton(
          onPressed: () {
            // Cancel order action
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
          child: const Text(
            'Annulla ed elimina ordine',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontFamily: 'BalooTamma2',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentButton() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: 16 + MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 40,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(
                      totalAmount: 31.75,
                      deliveryAddress: 'Via Antonio Ciseri 30, Locarno, 20121',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text(
                'Vai al pagamento',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'BalooTamma2',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
