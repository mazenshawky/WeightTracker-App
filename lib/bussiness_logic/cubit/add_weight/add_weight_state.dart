part of 'add_weight_cubit.dart';

@immutable
abstract class AddWeightState {}

class AddWeightInitial extends AddWeightState {}

class AddLoading extends AddWeightState {}

class AddSuccess extends AddWeightState {}

class AddErrorOccurred extends AddWeightState {
  final String errorMsg;

  AddErrorOccurred({required this.errorMsg});
}
