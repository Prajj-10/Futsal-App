import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_futsalapp/models/transaksi_model.dart';

class TransaksiService {
  CollectionReference _transaksiReference =
      FirebaseFirestore.instance.collection('bookings');

  Future<void> buatTransaksi(TransaksiModel transaksi) async {
    try {
      _transaksiReference.add({
        'field': transaksi.field.toJson(),
        'number': transaksi.number,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransaksiModel>> fetchTransaksi() async {
    try {
      QuerySnapshot hasil = await _transaksiReference.get();
      List<TransaksiModel> dataTransaksi = hasil.docs.map((e) {
        return TransaksiModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      print(hasil);
      return dataTransaksi;
    } catch (e) {
      throw e;
    }
  }
}
