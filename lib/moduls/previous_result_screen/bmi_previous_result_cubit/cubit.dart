
import 'package:bloc/bloc.dart';
import 'package:bmicalculator/models/userdata_model/user_data_model.dart';
import 'package:bmicalculator/moduls/previous_result_screen/bmi_previous_result_cubit/states.dart';
import 'package:bmicalculator/shared/components/components.dart';
import 'package:bmicalculator/shared/cubit/bmiappcubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiPreviousResultCubit extends Cubit<BmiPreviousResultStates> {
  BmiPreviousResultCubit() : super(BmiPreviousResultInitialStates());

  static BmiPreviousResultCubit get(context) => BlocProvider.of(context);

  List<UserDataModel> userData = [];

  void getUserPreviousData() {
    userData=[];

    emit(GetUserPreviousDataLoadingStates());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('userdata')
        .orderBy('date')
        .snapshots()
        .listen((event) {
          event.docs.forEach((element) {
            userData.add(UserDataModel.fromJson(element.data()));
          });
          emit(GetUserPreviousDataSuccessStates());
    });

  }


  void deleteUserDataItem({required String docId}) {

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('userdata')
        .doc(docId)
        .delete()
        .then((value) {
      getUserPreviousData();
    })
        .catchError((error){
          emit(DeleteUserDataItemErrorStates(error.toString()));
    });


  }
}
