// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:weight_tracker/data/models/weight.dart';

part 'add_weight_state.dart';

class AddWeightCubit extends Cubit<AddWeightState> {
  AddWeightCubit() : super(AddWeightInitial());

  Future<void> addWeight({required String weight}) async {
    emit(AddLoading());
    try {
      final docWeight = FirebaseFirestore.instance.collection('weights').doc();
      final weightModel = Weight(
        weight: weight,
        createdAt: DateTime.now(),
      );
      final json = weightModel.toJson();
      await docWeight.set(json);
      emit(AddSuccess());
    } catch (error) {
      emit(AddErrorOccurred(errorMsg: error.toString()));
    }
  }
}
