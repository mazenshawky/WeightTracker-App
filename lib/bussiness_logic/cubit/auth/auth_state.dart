part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Loading extends AuthState {}

class Success extends AuthState {}

class ErrorOccurred extends AuthState {
  final String errorMsg;

  ErrorOccurred({required this.errorMsg});
}
