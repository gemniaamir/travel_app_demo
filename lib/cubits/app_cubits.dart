import 'package:bloc/bloc.dart';
import 'package:travel_app/cubits/app_cubit_states.dart';
import 'package:travel_app/model/data_model.dart';
import 'package:travel_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits(this.data) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  void detailPage(DataModel data) {
    emit(DetailState(data));
  }

  void goHome() {
    emit(LoadedState(places));
  }
}
