import 'package:flutter/material.dart';
import '../models/medicine_model.dart';
import '../models/cart_model.dart';

class MedicineCategoryScreen extends StatefulWidget {
  const MedicineCategoryScreen({Key? key}) : super(key: key);

  @override
  State<MedicineCategoryScreen> createState() => _MedicineCategoryScreenState();
}

class _MedicineCategoryScreenState extends State<MedicineCategoryScreen> {
  final Cart _cart = Cart();
  String _selectedCategory = 'All';

  final List<Medicine> allMedicines = [
    Medicine(
      id: 1,
      name: 'Aspirin',
      description: 'Pain reliever and fever reducer',
      price: 5.99,
      category: 'Pain Relief',
      imageUrl: 'https://images.unsplash.com/photo-1587854692152-cbe660dbde0f?w=300&h=300&fit=crop',
      dosage: '500mg',
    ),
    Medicine(
      id: 2,
      name: 'Ibuprofen',
      description: 'Anti-inflammatory pain reliever',
      price: 7.99,
      category: 'Pain Relief',
      imageUrl: 'https://images.unsplash.com/photo-1584308666744-24d5f400f6f0?w=300&h=300&fit=crop',
      dosage: '200mg',
    ),
    Medicine(
      id: 3,
      name: 'Paracetamol',
      description: 'Mild pain and fever relief',
      price: 4.99,
      category: 'Pain Relief',
      imageUrl: 'https://images.unsplash.com/photo-1587854692152-cbe660dbde0f?w=300&h=300&fit=crop',
      dosage: '500mg',
    ),
    Medicine(
      id: 4,
      name: 'Amoxicillin',
      description: 'Bacterial infection treatment',
      price: 12.99,
      category: 'Antibiotics',
      imageUrl: 'https://images.unsplash.com/photo-1576091160550-112173f31c77?w=300&h=300&fit=crop',
      dosage: '250mg',
    ),
    Medicine(
      id: 5,
      name: 'Cetirizine',
      description: 'Allergy symptom relief',
      price: 6.99,
      category: 'Allergies',
      imageUrl: 'https://images.unsplash.com/photo-1631549916768-4873f158d7fd?w=300&h=300&fit=crop',
      dosage: '10mg',
    ),
    Medicine(
      id: 6,
      name: 'Omeprazole',
      description: 'Acid reflux treatment',
      price: 9.99,
      category: 'Digestive',
      imageUrl: 'https://images.unsplash.com/photo-1587854692152-cbe660dbde0f?w=300&h=300&fit=crop',
      dosage: '20mg',
    ),
  ];

  List<String> get categories {
    return ['All', ...allMedicines.map((m) => m.category).toSet().toList()];
  }

  List<Medicine> get filteredMedicines {
    if (_selectedCategory == 'All') {
      return allMedicines;
    }
    return allMedicines
        .where((medicine) => medicine.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: FilterChip(
                      label: Text(category),
                      selected: _selectedCategory == category,
                      onSelected: (selected) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                      backgroundColor: Colors.grey[200],
                      selectedColor: Colors.blue[700],
                      labelStyle: TextStyle(
                        color: _selectedCategory == category
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredMedicines.length,
              itemBuilder: (context, index) {
                final medicine = filteredMedicines[index];
                return Card(
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        child: Image.network(
                          medicine.imageUrl,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 120,
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(
                                  Icons.local_pharmacy,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              medicine.name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 3),
                            Text(
                              medicine.description,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '\$${medicine.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[700],
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  _cart.addItem(medicine);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          '${medicine.name} added to cart'),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue[700],
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5),
                                ),
                                child: const Text(
                                  'Add',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
