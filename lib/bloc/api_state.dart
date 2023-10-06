part of 'api_bloc.dart';

@immutable
sealed class ApiState {}

final class ApiInitial extends ApiState {}

final class ApiLoading extends ApiState {}

final class ApiSuccess extends ApiState {
  final String success;
  ApiSuccess(this.success);
}

final class ApiFailed extends ApiState {}
