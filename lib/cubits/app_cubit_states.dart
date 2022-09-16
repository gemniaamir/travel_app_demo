import 'package:equatable/equatable.dart';
import 'package:travel_app/model/data_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class WelcomeState extends CubitStates {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadingState extends CubitStates {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadedState extends CubitStates {
  final List<DataModel> places;
  LoadedState(this.places);

  @override
  List<Object?> get props => [places];
}

class DetailState extends CubitStates {
  final DataModel place;
  DetailState(this.place);

  @override
  List<Object?> get props => [place];
}
