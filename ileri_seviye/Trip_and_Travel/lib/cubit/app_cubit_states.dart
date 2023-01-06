import 'package:equatable/equatable.dart';

import '../model/data_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class WelcomeState extends CubitStates {
  @override
  List<Object?> get props => throw UnimplementedError();
}

///when data loading trigger that
class LoadingState extends CubitStates {
  @override
  List<Object?> get props => throw UnimplementedError();
}

///when data loaded sucessfully trigger that
class LoadedState extends CubitStates {
  LoadedState(this.places);
  final List<DataModel> places;
  @override

  ///When triggered from getData method, rebuilding UI bcs ı have new data.
  List<Object?> get props => [places];
}

class DetailState extends CubitStates {
  DetailState(this.places);
  final DataModel places;
  @override

  ///When triggered from getData method, rebuilding UI bcs ı have new data.
  List<Object?> get props => [places];
}
