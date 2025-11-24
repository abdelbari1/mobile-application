import 'package:flutter/material.dart';
import '../models/medicine_model.dart';
import '../models/cart_model.dart';

class MedicineListScreen extends StatefulWidget {
  const MedicineListScreen({Key? key}) : super(key: key);

  @override
  State<MedicineListScreen> createState() => _MedicineListScreenState();
}

class _MedicineListScreenState extends State<MedicineListScreen> {
  final Cart _cart = Cart();

  final List<Medicine> medicines = [
    Medicine(
      id: 1,
      name: 'Aspirin',
      description: 'Aspirin is a pain reliever and fever reducer. It is used to treat headaches, muscle aches, backaches, minor arthritis pain, menstrual cramps, and the common cold.',
      price: 5.99,
      category: 'Pain Relief',
      imageUrl: 'https://images.unsplash.com/photo-1587854692152-cbe660dbde0f?w=400&h=400&fit=crop',
      dosage: '500mg',
    ),
    Medicine(
      id: 2,
      name: 'Ibuprofen',
      description: 'Ibuprofen is a nonsteroidal anti-inflammatory drug (NSAID) used to reduce fever and treat pain or inflammation caused by headaches, muscle aches, arthritis, menstrual cramps, and the common cold.',
      price: 7.99,
      category: 'Pain Relief',
      imageUrl: 'https://images.unsplash.com/photo-1584308666744-24d5f400f6f0?w=400&h=400&fit=crop',
      dosage: '200mg',
    ),
    Medicine(
      id: 3,
      name: 'Paracetamol',
      description: 'Paracetamol is used to treat mild to moderate pain and to reduce fever. It is commonly used for headaches, muscle aches, backaches, minor arthritis pain, menstrual cramps, toothaches, and the common cold.',
      price: 4.99,
      category: 'Pain Relief',
      imageUrl: 'https://images.unsplash.com/photo-1587854692152-cbe660dbde0f?w=400&h=400&fit=crop',
      dosage: '500mg',
    ),
    Medicine(
      id: 4,
      name: 'Amoxicillin',
      description: 'Amoxicillin is an antibiotic used to treat bacterial infections. It works by stopping the growth of bacteria. This antibiotic treats only bacterial infections. It will not work for viral infections.',
      price: 12.99,
      category: 'Antibiotics',
      imageUrl: 'https://images.unsplash.com/photo-1576091160550-112173f31c77?w=400&h=400&fit=crop',
      dosage: '250mg',
    ),
    Medicine(
      id: 5,
      name: 'Cetirizine',
      description: 'Cetirizine is used to relieve allergy symptoms such as watery eyes, runny nose, itching eyes/nose/throat, and sneezing. It works by blocking a certain natural substance (histamine) that your body makes during an allergic reaction.',
      price: 6.99,
      category: 'Allergies',
      imageUrl: 'https://images.unsplash.com/photo-1631549916768-4873f158d7fd?w=400&h=400&fit=crop',
      dosage: '10mg',
    ),
    Medicine(
      id: 6,
      name: 'Omeprazole',
      description: 'Omeprazole is used to treat certain stomach and esophageal problems (such as acid reflux, ulcers). It works by decreasing the amount of acid your stomach makes. It relieves symptoms such as heartburn, difficulty swallowing, and persistent cough.',
      price: 9.99,
      category: 'Digestive',
      imageUrl: 'https://images.unsplash.com/photo-1587854692152-cbe660dbde0f?w=400&h=400&fit=crop',
      dosage: '20mg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          final medicine = medicines[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      medicine.imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 200,
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(
                              Icons.local_pharmacy,
                              size: 80,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    medicine.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Dosage: ${medicine.dosage}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    medicine.description,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${medicine.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          _cart.addItem(medicine);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${medicine.name} added to cart'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add_shopping_cart),
                        label: const Text('Add to Cart'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
