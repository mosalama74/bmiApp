import 'package:bloc/bloc.dart';
import 'package:bmicalculator/moduls/loginscreen/logincubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialStates());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;

  changeVisibility() {
    isPassword = !isPassword;
    emit(ChangePasswordVisibilityStates());
  }

  userLogin({
    required String email,
    required String password,
}) {
    emit(UserLoginLoadingsStates());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) {

          emit(UserLoginSuccessStates(value.user!.uid));
    })
        .catchError((error) {
          emit(UserLoginErrorStates(error.toString()));
    });
  }



}
