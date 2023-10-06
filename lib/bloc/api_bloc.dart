import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_pattern/data/services.dart';
part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<GetDataEvent>((event, emit) async {
      emit(ApiLoading());
      try {
        String success = await getData();

        emit(ApiSuccess(success));
      } catch (e) {
        emit(ApiFailed());
      }
    });
  }
}
