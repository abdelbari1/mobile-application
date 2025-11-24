import 'cart_item_model.dart';
import 'medicine_model.dart';

class Cart {
  static final Cart _instance = Cart._internal();
  final List<CartItem> _items = [];

  Cart._internal();

  factory Cart() {
    return _instance;
  }

  List<CartItem> get items => _items;

  void addItem(Medicine medicine) {
    final existingItem = _items.firstWhere(
      (item) => item.medicine.id == medicine.id,
      orElse: () => CartItem(medicine: medicine),
    );

    if (_items.contains(existingItem)) {
      existingItem.quantity++;
    } else {
      _items.add(CartItem(medicine: medicine));
    }
  }

  void removeItem(int medicineId) {
    _items.removeWhere((item) => item.medicine.id == medicineId);
  }

  void updateQuantity(int medicineId, int quantity) {
    final item = _items.firstWhere(
      (item) => item.medicine.id == medicineId,
      orElse: () => CartItem(medicine: Medicine(
        id: -1,
        name: '',
        description: '',
        price: 0,
        category: '',
        imageUrl: '',
        dosage: '',
      )),
    );
    if (item.medicine.id != -1) {
      item.quantity = quantity;
    }
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void clearCart() {
    _items.clear();
  }

  int get itemCount => _items.length;
}
