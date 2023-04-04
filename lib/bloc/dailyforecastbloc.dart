import 'package:flutter_bloc/flutter_bloc.dart';

class DailyForecastBloc extends Bloc<DFEvent, DFState> {
  DailyForecastBloc() : super(DFInitialState());
}

abstract class DFEvent {}

abstract class DFState {}

class DFInitialState extends DFState {}
