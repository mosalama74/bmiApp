import 'package:bmicalculator/layouts/bmicalculator_layout.dart';
import 'package:bmicalculator/moduls/loginscreen/logincubit/cubit.dart';
import 'package:bmicalculator/moduls/loginscreen/logincubit/states.dart';
import 'package:bmicalculator/moduls/register_screen/register_screen.dart';
import 'package:bmicalculator/shared/components/components.dart';
import 'package:bmicalculator/shared/components/customt_text_form_field/custom_text_form_field.dart';
import 'package:bmicalculator/shared/components/customtext/customtext.dart';
import 'package:bmicalculator/shared/network/local/cachehelper/cachehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
      if (state is UserLoginSuccessStates) {
          showToast(message: 'SignIn Successfully', state: ToastStates.SUCCESS);
          CacheHelper.saveData(key: 'uId', value: state.uId);
          print(state.uId);
          print(CacheHelper.getData(key: 'uId').toString());
          print(uId);

      }
      else  if (state is UserLoginErrorStates)
        {
          showToast(message: state.error, state: ToastStates.ERROR);

        }
      },
      builder: (context, state) {
        LoginCubit cubitOb = LoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsetsDirectional.all(15.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Login',
                        fontsize: 35,
                      ),
                      CustomText(
                        text: 'Please SignIn to Continue',
                        fontsize: 25,
                        textcolor: Colors.grey,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter your email',
                        controller: emailcontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your email again';
                          }

                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter your password',
                        controller: passwordcontroller,
                        obscureText: cubitOb.isPassword,
                        suffixIcon: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            cubitOb.changeVisibility();
                          },
                          icon: cubitOb.isPassword
                              ?  Icon(Icons.visibility_outlined,color: Colors.black,)
                              : Icon(Icons.visibility_off_outlined,color: Colors.black,),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your password again';
                          }

                          return null;
                        },
                        onFieldSubmitted: (value) {
                          if (formkey.currentState!.validate()) {
                            cubitOb.userLogin(
                                email: emailcontroller.text,
                                password: passwordcontroller.text);
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: Icons.lock_outline,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Container(
                          padding: EdgeInsetsDirectional.only(
                              bottom: 5, top: 5, start: 10, end: 10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: AlignmentDirectional.centerStart,
                              end: AlignmentDirectional.centerEnd,
                              transform: GradientRotation(1),
                              colors: [
                                Colors.amber,
                                Colors.green,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      cubitOb.userLogin(
                                          email: emailcontroller.text,
                                          password: passwordcontroller.text);
                                    } else {
                                      return null;
                                    }
                                  },
                                  child: CustomText(
                                    text: 'Login',
                                    fontsize: 20,
                                    textcolor: Colors.white,
                                  )),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Don\'t have an account?',
                            fontsize: 18,
                            textcolor: Colors.grey,
                          ),
                          TextButton(
                            onPressed: () {

                              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                            },
                            child: CustomText(
                              text: 'SignUp',
                              fontsize: 18,
                              textcolor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
