part of 'api_bloc.dart';

@immutable
sealed class ApiEvent {}
class GetDataEvent extends ApiEvent{}
