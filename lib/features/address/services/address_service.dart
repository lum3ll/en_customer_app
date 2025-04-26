import '../models/address_model.dart';

class AddressService {
  // Singleton pattern
  static final AddressService _instance = AddressService._internal();
  factory AddressService() => _instance;
  AddressService._internal();

  // Mock data
  final List<AddressModel> _addresses = AddressModel.getMockAddresses();
  
  // Get all addresses
  List<AddressModel> getAllAddresses() {
    return _addresses;
  }
  
  // Get default address
  AddressModel? getDefaultAddress() {
    try {
      return _addresses.firstWhere((address) => address.isDefault);
    } catch (e) {
      return _addresses.isNotEmpty ? _addresses.first : null;
    }
  }
  
  // Add new address
  void addAddress(AddressModel address) {
    _addresses.add(address);
  }
  
  // Set default address
  void setDefaultAddress(String id) {
    for (var i = 0; i < _addresses.length; i++) {
      _addresses[i] = AddressModel(
        id: _addresses[i].id,
        name: _addresses[i].name,
        street: _addresses[i].street,
        number: _addresses[i].number,
        floor: _addresses[i].floor,
        city: _addresses[i].city,
        zipCode: _addresses[i].zipCode,
        phoneNumber: _addresses[i].phoneNumber,
        isDefault: _addresses[i].id == id,
      );
    }
  }
}