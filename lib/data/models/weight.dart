import 'package:cloud_firestore/cloud_firestore.dart';

class Weight {
  final String weight;
  final DateTime createdAt;

  Weight({required this.weight, required this.createdAt});

  static Weight fromJson(Map<String, dynamic> json) => Weight(
        weight: json['weight'],
        createdAt: (json['createdAt'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'weight': weight,
        'createdAt': createdAt,
      };
}
