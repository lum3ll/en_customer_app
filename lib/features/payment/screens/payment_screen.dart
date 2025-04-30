import 'package:eneed_cust_app/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../../../shared/widgets/custom_button.dart';
import 'payment_success_screen.dart';

class PaymentScreen extends StatefulWidget {
  final double totalAmount;
  final String deliveryAddress;
  
  const PaymentScreen({
    super.key, 
    required this.totalAmount,
    required this.deliveryAddress,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool _showAddCardModal = false;
  bool _cashOnDelivery = false;
  bool _cardPayment = false;
  String? _selectedCardNumber;
  
  // Controllers for card details
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  String _selectedCountry = 'Svizzera';
  
  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const CustomAppBar(
        title: "Procedi al pagamento",
        centerTitle: true,
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
                
                // Payment method section
                _buildSectionTitle('Come vuoi pagare?'),
                _buildPaymentOptions(),
                
                // Delivery address section
                _buildSectionTitle('Consegna a'),
                _buildDeliveryAddress(),
                
                // Space for the bottom button
                const SizedBox(height: 160),
              ],
            ),
          ),
          
          // Add card modal
          if (_showAddCardModal)
            _buildAddCardModal(),
          
          // Bottom area with total and payment button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomBar(),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 24, bottom: 8),
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
    return Container(
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
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildPaymentOptions() {
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
          // Cash on delivery option
          InkWell(
            onTap: () {
              setState(() {
                _cashOnDelivery = true;
                _cardPayment = false;
                _selectedCardNumber = null;
              });
            },
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _cashOnDelivery ? AppColors.primary : Colors.grey.shade400,
                      width: 2,
                    ),
                  ),
                  child: _cashOnDelivery
                      ? Center(
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                const Text(
                  'Paga in contanti alla consegna',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'BalooTamma2',
                  ),
                ),
              ],
            ),
          ),
          
          // Credit card option
          if (_selectedCardNumber != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _cashOnDelivery = false;
                    _cardPayment = true;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _cardPayment ? AppColors.primary : Colors.grey.shade400,
                              width: 2,
                            ),
                          ),
                          child: _cardPayment
                              ? Center(
                                  child: Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                )
                              : null,
                        ),
                        const SizedBox(width: 12),
                        Image.asset(
                          'assets/images/mastercard.png',
                          width: 32,
                          height: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '*****${_selectedCardNumber!.substring(_selectedCardNumber!.length - 4)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'BalooTamma2',
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'modifica',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
          // Add new card button
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: InkWell(
              onTap: () {
                setState(() {
                  _showAddCardModal = true;
                });
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: AppColors.primary,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _selectedCardNumber == null 
                        ? 'Aggiungi Carta di Credito'
                        : 'Aggiungi nuova Carta di Credito',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildDeliveryAddress() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
            image: const DecorationImage(
              image: AssetImage('assets/images/map.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.location_on,
              color: AppColors.primary,
              size: 40,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.deliveryAddress,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'BalooTamma2',
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () {},
                child: Text(
                  'Vedi mappa',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Aggiungi istruzioni per il rider',
                onPressed: () {},
                backgroundColor: Colors.white,
                textColor: AppColors.primary,
                borderColor: AppColors.primary,
                borderWidth: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildAddCardModal() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showAddCardModal = false;
        });
      },
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: GestureDetector(
          onTap: () {}, // Prevent closing when tapping inside the modal
          child: Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: AppColors.primary,
                        onPressed: () {
                          setState(() {
                            _showAddCardModal = false;
                          });
                        },
                      ),
                      const Text(
                        'Aggiungi carta di pagamento',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'BalooTamma2',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _showAddCardModal = false;
                          });
                        },
                        child: Text(
                          'Chiudi',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Card types
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/visa.png', height: 24),
                            const SizedBox(width: 16),
                            Image.asset('assets/images/amex.png', height: 24),
                            const SizedBox(width: 16),
                            Image.asset('assets/images/mastercard.png', height: 24),
                            const SizedBox(width: 16),
                            Image.asset('assets/images/discover.png', height: 24),
                          ],
                        ),
                        const SizedBox(height: 24),
                        
                        // Card number field
                        CustomTextField(
                          controller: _cardNumberController,
                          keyboardType: TextInputType.number,
                          placeholder: 'Numero carta',
                          suffixIcon: Image.asset(
                            'assets/images/mastercard.png',
                            width: 32,
                            height: 20,
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Expiry date and CVV
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: _expiryDateController,
                                keyboardType: TextInputType.datetime,
                                placeholder: 'MM/YY',
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: CustomTextField(
                                controller: _cvvController,
                                keyboardType: TextInputType.number,
                                placeholder: 'CVV',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        
                        // Name field
                        CustomTextField(
                          controller: _nameController,
                          placeholder: 'Nome',
                        ),
                        const SizedBox(height: 16),
                        
                        // Surname field
                        CustomTextField(
                          controller: _surnameController,
                          placeholder: 'Cognome',
                        ),
                        const SizedBox(height: 16),
                        
                        // Country dropdown
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedCountry,
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: <String>['Svizzera', 'Italia', 'Francia', 'Germania']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedCountry = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // ZIP code field
                        CustomTextField(
                          controller: _zipCodeController,
                          keyboardType: TextInputType.number,
                          placeholder: 'CAP',
                        ),
                        const SizedBox(height: 32),
                        
                        // Save button
                        CustomButton(
                          text: 'Salva',
                          onPressed: () {
                            // Save card logic
                            setState(() {
                              _selectedCardNumber = _cardNumberController.text;
                              _cardPayment = true;
                              _cashOnDelivery = false;
                              _showAddCardModal = false;
                            });
                          },
                          backgroundColor: AppColors.primary,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildBottomBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Totale dell\'ordine',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'BalooTamma2',
                  ),
                ),
                Text(
                  '${widget.totalAmount.toStringAsFixed(2).replaceAll('.', ',')} CHF',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'BalooTamma2',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Paga',
              onPressed: () {
                if (_cashOnDelivery || _cardPayment) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentSuccessScreen(),
                    ),
                  );
                }
              },
              backgroundColor: AppColors.primary,
              textColor: Colors.white,
              // disabledColor: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}