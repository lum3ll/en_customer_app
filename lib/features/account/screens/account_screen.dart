import 'package:eneed_cust_app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const CustomAppBar(title: "Account"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSection([
                _buildMenuItem(
                  'Ordini',
                  'assets/icons/receipt.png',
                  onTap: () {},
                ),
                _buildMenuItem(
                  'Preferiti',
                  'assets/icons/heart.png',
                  onTap: () {},
                ),
              ]),
              const SizedBox(height: 16),
              _buildSection([
                _buildMenuItem(
                  'Informazioni sull\'account',
                  'assets/icons/user.png',
                  onTap: () {},
                ),
                _buildMenuItem(
                  'Metodi di pagamento',
                  'assets/icons/credit-card.png',
                  onTap: () {},
                ),
                _buildMenuItem(
                  'Indirizzi',
                  'assets/icons/location-dot.png',
                  onTap: () {},
                ),
                _buildMenuItem(
                  'Notifiche',
                  'assets/icons/bell.png',
                  onTap: () {},
                ),
                _buildMenuItem(
                  'Live Chat Support',
                  'assets/icons/headset.png',
                  badge: '2',
                  onTap: () {},
                ),
              ]),
              const SizedBox(height: 16),
              _buildSection([
                _buildMenuItem('Supporto & FAQ', '', onTap: () {}),
                _buildMenuItem('Lavora con noi', '', onTap: () {}),
                _buildMenuItem('Informazioni e Privacy', '', onTap: () {}),
                _buildMenuItem('Esci', '', textColor: Colors.red, onTap: () {}),
              ]),
              const SizedBox(height: 24),
              Text(
                'Accesso effettuato come alessandra.rossi@gmail.com',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildMenuItem(
    String title,
    String? iconPath, {
    String? badge,
    Color? textColor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[100]!, width: 1),
          ),
        ),
        child: Row(
          children: [
            if (iconPath != null && iconPath.isNotEmpty)
              Image.asset(
                iconPath,
                width: 24,
                height: 24,
                color: textColor ?? Colors.black,
              ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: textColor ?? Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            if (badge != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badge,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            Icon(Icons.chevron_right, color: Colors.grey[400], size: 24),
          ],
        ),
      ),
    );
  }
}
