import 'package:equatable/equatable.dart';

class LapanganModel extends Equatable {
  final String id;
  final String name;
  final String type;
  final String imageUrl;
  final String description;
  final double rating;
  final int price;

  LapanganModel({
    required this.id,
    this.name = '',
    this.type = '',
    this.imageUrl = '',
    this.description = '',
    this.rating = 0.0,
    this.price = 0,
  });

  factory LapanganModel.fromJson(String id, Map<String, dynamic> json) =>
      LapanganModel(
        id: id,
        name: json['name'],
        imageUrl: json['imageUrl'],
        type: json['type'],
        description: json['description'],
        rating: json['rating'],
        price: json['price'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
        'type': type,
        'description': description,
        'rating': rating,
        'price': price,
      };

  @override
  List<Object?> get props => [id, name, imageUrl, type, rating, price];
}
