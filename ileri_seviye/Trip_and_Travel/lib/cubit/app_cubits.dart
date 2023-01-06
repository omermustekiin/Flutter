import 'package:bloc/bloc.dart';
import 'package:trip_and_travel/pages/welcome_page.dart';
import 'package:trip_and_travel/services/data_services.dart';
import '../model/data_model.dart';
import 'app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;
  void getData() async {
    ///when data loading
    /// calling the getInfo method and getting my data from server and assigning to "places" variable
    ///and triggering LoadedStates
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHomePage() {
    emit(LoadedState(places));
  }
}
