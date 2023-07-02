// ignore_for_file: prefer_typing_uninitialized_variables, empty_catches

import 'package:bloc/bloc.dart';
import 'package:cubit_app/cubit/app_cubit_states.dart';
import 'package:cubit_app/model/data_model.dart';
import 'package:cubit_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;
  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo(); // as we might wait for the data, it needs to be async
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
