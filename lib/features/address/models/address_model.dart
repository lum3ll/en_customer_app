class AddressModel {
  final String id;
  final String name;
  final String street;
  final String number;
  final String? floor;
  final String city;
  final String zipCode;
  final String phoneNumber;
  final bool isDefault;

  AddressModel({
    required this.id,
    required this.name,
    required this.street,
    required this.number,
    this.floor,
    required this.city,
    required this.zipCode,
    required this.phoneNumber,
    this.isDefault = false,
  });

  // Mock data for the app
  static List<AddressModel> getMockAddresses() {
    return [
      AddressModel(
        id: '1',
        name: 'Casa dei nonni',
        street: 'Via Antonio Ciseri',
        number: '49/B',
        city: 'Locarno',
        zipCode: '6516',
        phoneNumber: '+39 3456789221',
        isDefault: true,
      ),
      AddressModel(
        id: '2',
        name: 'Casa',
        street: 'Viale Venezia',
        number: '24',
        city: 'Milano',
        zipCode: '20133',
        phoneNumber: '+39 3456789221',
      ),
    ];
  }
}