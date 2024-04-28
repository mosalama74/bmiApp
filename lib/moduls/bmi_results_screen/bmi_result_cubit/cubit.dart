import 'package:bloc/bloc.dart';
import 'package:bmicalculator/moduls/bmi_results_screen/bmi_result_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiResultCubit extends Cubit<BmiResultStates> {
  BmiResultCubit() : super(BmiResultInitialStates());

  static BmiResultCubit get(context) => BlocProvider.of(context);



}
