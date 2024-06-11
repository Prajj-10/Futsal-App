import 'package:demo_futsalapp/models/lapangan_model.dart';
import 'package:equatable/equatable.dart';

class TransaksiModel extends Equatable {
  final LapanganModel field;
  final int number;
  final String id;

  TransaksiModel({
    required this.field,
    required this.number,
    this.id = '',
  });

  factory TransaksiModel.fromJson(String id, Map<String, dynamic> json) =>
      TransaksiModel(
        field: LapanganModel.fromJson(json['field']['id'], json['field']),
        id: id,
        number: json['number'],
      );

  @override
  List<Object?> get props => [field, number];
}
