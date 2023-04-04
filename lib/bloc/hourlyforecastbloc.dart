import 'package:flutter_bloc/flutter_bloc.dart';

class HourlyForecastBloc extends Bloc<HFEvent, HFState> {
  HourlyForecastBloc() : super(HFInitialState());
}

abstract class HFEvent {}

abstract class HFState {}

class HFInitialState extends HFState {}
