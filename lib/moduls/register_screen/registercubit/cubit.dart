import 'package:bloc/bloc.dart';
import 'package:bmicalculator/models/usermodel/usermodel.dart';
import 'package:bmicalculator/moduls/register_screen/registercubit/states.dart';
import 'package:bmicalculator/shared/network/local/cachehelper/cachehelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;

  changeVisibility() {
    isPassword = !isPassword;
    emit(ChangePasswordVisibilityStates());
  }
  void userRegister({
    required String name,
    required String email,
    required String password,
  }) {
    emit(UserRegisterLoadingsStates());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);
      userCreate(
        name: name,
        uId: value.user!.uid,
        email: email,
      );
    }).catchError((error) {
      UserRegisterErrorStates(error.toString());
    });
  }

  void userCreate({
    required String name,
    required String uId,
    required String email,
  }) {
    emit(CreateUserLoadingsStates());

    UserModel model = UserModel(name: name, uId: uId, email: email);

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessStates());
    }).catchError((error) {
      emit(CreateUserErrorStates(error.toString()));
    });
  }
}
