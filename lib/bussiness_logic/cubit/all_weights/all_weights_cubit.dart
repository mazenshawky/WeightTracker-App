// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:weight_tracker/data/models/weight.dart';

part 'all_weights_state.dart';

class AllWeightsCubit extends Cubit<AllWeightsState> {
  AllWeightsCubit() : super(AllWeightsInitial());

  Query<Weight> viewWeights() {
    return FirebaseFirestore.instance
        .collection('weights')
        .orderBy('createdAt', descending: true)
        .withConverter(
          fromFirestore: (snapshot, _) => Weight.fromJson(snapshot.data()!),
          toFirestore: (weight, _) => weight.toJson(),
        );
  }

  void deleteWeight({required String docId}) {
    final docWeight =
        FirebaseFirestore.instance.collection('weights').doc(docId);

    docWeight.delete();
  }

  void editWeight({required String docId, required String newWeight}) {
    final docWeight =
        FirebaseFirestore.instance.collection('weights').doc(docId);

    docWeight.update({'weight': newWeight});
  }

  String filterDateTime(DateTime dateTime) {
    String dateTimeString = dateTime.toString();
    return dateTimeString.substring(0, dateTimeString.length - 7);
  }
}
