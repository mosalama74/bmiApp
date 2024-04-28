import 'package:bloc/bloc.dart';
import 'package:bmicalculator/models/userdata_model/user_data_model.dart';
import 'package:bmicalculator/models/usermodel/usermodel.dart';
import 'package:bmicalculator/shared/components/components.dart';
import 'package:bmicalculator/shared/cubit/bmiappstates.dart';
import 'package:bmicalculator/shared/network/local/cachehelper/cachehelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiAppCubit extends Cubit<BmiAppStates> {
  BmiAppCubit() : super(BmiAppInitialStates());

  static BmiAppCubit get(context) => BlocProvider.of(context);

  int slidervalue = 90;
  int height = 150;
  int age = 20;
  int weight = 70;
  double result = 0.0;

  bool ismale = true;

  void malepressed() {
    ismale = true;
    emit(MalePressedState());
  }

  void femalepressed() {
    ismale = false;

    emit(FeMalePressedState());
  }

  void changeslidervalue(int sliderval) {
    height = sliderval;
    emit(ChangeSliderValueStates());
  }

  void agefabiconminus() {
    age--;
    emit(ChangeFabAgeMinusStates());
  }

  void agefabiconplus() {
    age++;
    emit(ChangeFabAgePlusStates());
  }

  void weightfabiconminus() {
    weight--;
    emit(ChangeFabWeightMinusStates());
  }

  void weightfabiconplus() {
    weight++;
    emit(ChangeFabpWeightplusStates());
  }

  UserModel? userModel;

  void getUserData() {
    emit(GetUserDataLoadiingStates());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data());
      emit(GetUserDataSuccessStates());
    }).catchError((error) {
      emit(GetUserDataErrorStates(error.toString()));
    });
  }

List<String> docId =[];

  void saveUserBmiDataResult({
    required String age,
    required String gender,
    required String height,
    required String weight,
    required String bmiResult,
    required String bmistatus,
    required String bmiadvice,
    required String date,
  }) {
    emit(SaveUserBmiDataLoadiingStates());

    UserDataModel model = UserDataModel(
      name: userModel!.name,
      email: userModel!.email,
      uId: userModel!.uId,
      age: age,
      gender: gender,
      height: height,
      weight: weight,
      date: date,
      bmiStatus: bmistatus,
      bmiAdvice: bmiadvice,
      bmiResult: bmiResult,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('userdata')
        .add(model.toMap())
        .then((DocumentReference doc) {
          docId.add(doc.id);
      emit(SaveUserBmiDataSuccessStates());
    }).catchError((error) {
      emit(SaveUserBmiDataErrorStates(error.toString()));
    });
  }

  String bmiMessage = '';
  String bmiStatus = '';
  Color bmiStatusColor = Colors.black;

  void bmiConclusion({required result}) {
    if (result > 30) {
      bmiStatus = 'Obesity';
      bmiMessage = 'Please Work Hard to reduce Obesity';
      bmiStatusColor = Colors.pink;
    } else if (result >= 25) {
      bmiStatus = 'Overweight';
      bmiMessage = 'Do regular exercise to reduce your weight';
      bmiStatusColor = Colors.orange;
    } else if (result >= 18.5) {
      bmiStatus = 'Normal';
      bmiMessage = 'Enjoy your weight is ideal ';
      bmiStatusColor = Colors.green;
    } else if (result < 18.5) {
      bmiStatus = 'Underweight';
      bmiMessage = 'You need to increase your weight ';
      bmiStatusColor = Colors.red;
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut().then((value) {
      CacheHelper.removeData(key: 'uId');
      emit(SignOutSuccessStates());
    }).catchError((error) {
      emit(SignOutErrorStates(error.toString()));
    });
  }
}
