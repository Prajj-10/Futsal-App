import 'package:bloc/bloc.dart';

class FieldCubit extends Cubit<int> {
  FieldCubit() : super(0);

  void pilihLapangan(int number) {
    emit(number);
    print("Nomor lapangan yg dipilih $number");
  }
}
