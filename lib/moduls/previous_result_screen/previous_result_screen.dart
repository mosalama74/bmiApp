import 'package:bmicalculator/models/userdata_model/user_data_model.dart';
import 'package:bmicalculator/moduls/previous_result_screen/bmi_previous_result_cubit/cubit.dart';
import 'package:bmicalculator/moduls/previous_result_screen/bmi_previous_result_cubit/states.dart';
import 'package:bmicalculator/shared/components/customtext/customtext.dart';
import 'package:bmicalculator/shared/cubit/bmiappcubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PreviousResultScreen extends StatelessWidget {
  const PreviousResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      BmiPreviousResultCubit.get(context).getUserPreviousData();
      return BlocConsumer<BmiPreviousResultCubit, BmiPreviousResultStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          BmiPreviousResultCubit cubitOb = BmiPreviousResultCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: ConditionalBuilder(
              condition: cubitOb.userData.length > 0,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return buildScreenItem(cubitOb.userData[index], context,index);
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                    itemCount: cubitOb.userData.length,
                  ),
                );
              },
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      );
    });
  }

  Widget buildScreenItem(UserDataModel model, context,index) => Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'date',
                              fontsize: 20,
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            CustomText(
                              text: '${model.date}',
                              fontsize: 15,
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 25,
                                child: IconButton(
                                    onPressed: () {
                                      BmiPreviousResultCubit.get(context).deleteUserDataItem( docId:BmiAppCubit.get(context).docId[index]);
                                    },
                                    icon: Icon(
                                      Icons.delete_rounded,
                                      size: 30,
                                      color: Colors.white,
                                    ))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Name',
                          fontsize: 20,
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        CustomText(
                          text: '${model.name}',
                          fontsize: 15,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Gender',
                          fontsize: 20,
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        CustomText(
                          text: '${model.gender}',
                          fontsize: 15,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Email',
                          fontsize: 20,
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        CustomText(
                          text: '${model.email}',
                          fontsize: 15,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Age',
                          fontsize: 20,
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        CustomText(
                          text: '${model.age}',
                          fontsize: 15,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Height',
                          fontsize: 20,
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        CustomText(
                          text: '${model.height}',
                          fontsize: 15,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Weight',
                          fontsize: 20,
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        CustomText(
                          text: '${model.weight}',
                          fontsize: 15,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'BmiResult',
                          fontsize: 20,
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        CustomText(
                          text: '${model.bmiResult}',
                          fontsize: 15,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomText(
                            text: 'BmiAdvice',
                            fontsize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        CustomText(
                          text: '${model.bmiAdvice}',
                          fontsize: 15,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'BmiStatus',
                              fontsize: 20,
                              textcolor:
                                  BmiAppCubit.get(context).bmiStatusColor,
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            CustomText(
                              text: '${model.bmiStatus}',
                              fontsize: 15,
                              textcolor:
                                  BmiAppCubit.get(context).bmiStatusColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
