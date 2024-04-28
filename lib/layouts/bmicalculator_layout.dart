import 'dart:math';

import 'package:bmicalculator/moduls/bmi_results_screen/bmi_result_cubit/cubit.dart';
import 'package:bmicalculator/moduls/bmi_results_screen/bmiresultscreen.dart';
import 'package:bmicalculator/moduls/gender_screen/gender_screen.dart';
import 'package:bmicalculator/moduls/height_screen/height_screen.dart';
import 'package:bmicalculator/moduls/loginscreen/loginscreen.dart';
import 'package:bmicalculator/moduls/previous_result_screen/bmi_previous_result_cubit/cubit.dart';
import 'package:bmicalculator/moduls/previous_result_screen/previous_result_screen.dart';
import 'package:bmicalculator/moduls/setting_screen/setting_screen.dart';
import 'package:bmicalculator/moduls/weightAge_screen/weightAge_screen.dart';
import 'package:bmicalculator/shared/components/components.dart';
import 'package:bmicalculator/shared/components/customButton/custombutton.dart';
import 'package:bmicalculator/shared/components/customtext/customtext.dart';
import 'package:bmicalculator/shared/cubit/bmiappcubit.dart';
import 'package:bmicalculator/shared/cubit/bmiappstates.dart';
import 'package:bmicalculator/shared/network/local/cachehelper/cachehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BmiCalulcatorLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiAppCubit, BmiAppStates>(
      listener: (BuildContext context, state) {
        if (state is SaveUserBmiDataSuccessStates) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BmiResultScreen(
                gender: BmiAppCubit.get(context).ismale ? 'Male' : 'Female',
                age: BmiAppCubit.get(context).age,
                height: BmiAppCubit.get(context).height,
                weight: BmiAppCubit.get(context).weight,
                result: BmiAppCubit.get(context).result,
              ),
            ),
          );
        }

        if (state is SignOutSuccessStates) {
          showToast(message: 'Good Bye', state: ToastStates.SUCCESS);
        }
      },
      builder: (BuildContext context, state) {
        BmiAppCubit cubitOb = BmiAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: CustomText(
              text: 'BmiCalculator',
              fontsize: 25,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen(),));
                  },
                  icon: const Icon(
                    Icons.settings,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {
                    cubitOb.signOut();
                  },
                  icon: const Icon(
                    Icons.exit_to_app,
                    size: 30,
                  )),
            ],
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const GenderScreen(),
                  const SizedBox(
                    height: 10,
                  ),
                  const HeightScreen(),
                  const SizedBox(
                    height: 10,
                  ),
                  const WeightAgeScreen(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomMaterialButton(
                          child: CustomText(
                            text: 'Previous Results',
                            fontsize: 20.0,
                          ),
                          onPressed: () {
                            uId =CacheHelper.getData(key: 'uId');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PreviousResultScreen(),
                                ));
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomMaterialButton(
                          child: CustomText(
                            text: 'Calculate',
                            fontsize: 20,
                          ),
                          height: 40,
                          onPressed: () {
                            BmiAppCubit.get(context).result =
                                BmiAppCubit.get(context).weight /
                                    pow(BmiAppCubit.get(context).height / 100, 2);
                            cubitOb.saveUserBmiDataResult(
                              age: cubitOb.age.toString(),
                              gender: cubitOb.ismale ? 'Male' : 'Female',
                              height: cubitOb.height.toString(),
                              weight: cubitOb.weight.toString(),
                              bmiResult: cubitOb.result.toString(),
                              date: DateFormat.yMMMd()
                                  .format(DateTime.now())
                                  .toString(),
                              bmiadvice: cubitOb.bmiMessage,
                              bmistatus: cubitOb.bmiStatus,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
