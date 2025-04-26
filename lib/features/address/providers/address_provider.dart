import 'package:flutter/material.dart';
import '../models/address_model.dart';
import '../services/address_service.dart';

class AddressProvider extends ChangeNotifier {
  final AddressService _addressService = AddressService();
  
  AddressModel? _currentAddress;
  
  AddressProvider() {
    _currentAddress = _addressService.getDefaultAddress();
  }
  
  AddressModel? get currentAddress => _currentAddress;
  
  List<AddressModel> get allAddresses => _addressService.getAllAddresses();
  
  void setCurrentAddress(AddressModel address) {
    _currentAddress = address;
    notifyListeners();
  }
  
  void addNewAddress(AddressModel address) {
    _addressService.addAddress(address);
    notifyListeners();
  }
  
  void setDefaultAddress(String id) {
    _addressService.setDefaultAddress(id);
    _currentAddress = _addressService.getDefaultAddress();
    notifyListeners();
  }
}