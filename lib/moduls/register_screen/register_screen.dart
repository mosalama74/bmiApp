import 'package:bmicalculator/layouts/bmicalculator_layout.dart';
import 'package:bmicalculator/moduls/authPage/authPage.dart';
import 'package:bmicalculator/moduls/loginscreen/loginscreen.dart';
import 'package:bmicalculator/moduls/register_screen/registercubit/cubit.dart';
import 'package:bmicalculator/moduls/register_screen/registercubit/states.dart';
import 'package:bmicalculator/shared/components/components.dart';
import 'package:bmicalculator/shared/components/customt_text_form_field/custom_text_form_field.dart';
import 'package:bmicalculator/shared/components/customtext/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  var namecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is CreateUserSuccessStates) {
          showToast(message:'SignIn Successfully', state: ToastStates.SUCCESS);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => AuthPAge(),),
            (route) => false,
          );
        }else if(state is CreateUserErrorStates){
          print('the error is '+ state.error.toString());
          showToast(message: state.error, state: ToastStates.ERROR);

        }
      },
      builder: (context, state) {
        RegisterCubit cubitOb = RegisterCubit.get(context);
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
                        text: 'Create Account',
                        fontsize: 35,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextFormField(
                        hintText: 'Full name',
                        controller: namecontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your Name';
                          }

                          return null;
                        },
                        keyboardType: TextInputType.text,
                        prefixIcon: Icons.person,
                      ),
                      SizedBox(
                        height: 20,
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
                              ? Icon(Icons.visibility_off_outlined)
                              : Icon(Icons.visibility),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your password again';
                          }

                          return null;
                        },
                        onFieldSubmitted: (value) {
                          if (formkey.currentState!.validate()) {
                            cubitOb.userRegister(
                                name: namecontroller.text,
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
                                      cubitOb.userRegister(
                                          name: namecontroller.text,
                                          email: emailcontroller.text,
                                          password: passwordcontroller.text);
                                    } else {
                                      return null;
                                    }
                                  },
                                  child: CustomText(
                                    text: 'SignUp',
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
                            text: 'Already have an account?',
                            fontsize: 18,
                            textcolor: Colors.grey,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ));
                            },
                            child: CustomText(
                              text: 'SignIn',
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
