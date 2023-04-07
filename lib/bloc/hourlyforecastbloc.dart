import 'package:flutter_bloc/flutter_bloc.dart';

class HourlyForecastBloc extends Bloc<int, HFState> {
  HourlyForecastBloc() : super(HFInitialState());
}

abstract class HFState {}

class HFInitialState extends HFState {}
