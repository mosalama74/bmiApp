import 'package:bloc/bloc.dart';
import 'package:bmicalculator/models/usermodel/usermodel.dart';
import 'package:bmicalculator/moduls/setting_screen/setting_cubit/states.dart';
import 'package:bmicalculator/shared/components/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingStates> {
  SettingCubit() : super(SettingInitialStates());

  static SettingCubit get(context) => BlocProvider.of(context);


  bool isPassword = true;

 void changeVisibility() {
    isPassword = !isPassword;
    emit(ChangePasswordVisibilityStates());
  }


  void updateUserInfo({required String name,required String email}) {
    UserModel model = UserModel(
      name: name,
      email: email,
      uId: uId,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(model.toMap())
    .then((value) {
      getUserInfo();
      emit(UpdateUserDataSuccessStates());
    })
    .catchError((error){
      emit(UpdateUserDataErrorStates(error.tostring));
    });
  }


  List<UserModel> userInfo = [];


  void getUserInfo() {
          userInfo = [];
          FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .get()
      .then((value) {
        userInfo.add(UserModel.fromJson(value.data()));
        emit(GetUserDataSuccessStates());
      })
      .catchError((error){
        emit(GetUserDataErrorStates(error.tostring));
      });
  }

}
