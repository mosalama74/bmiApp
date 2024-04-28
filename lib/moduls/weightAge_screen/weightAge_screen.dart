import 'package:bmicalculator/shared/components/customtext/customtext.dart';
import 'package:bmicalculator/shared/cubit/bmiappcubit.dart';
import 'package:bmicalculator/shared/cubit/bmiappstates.dart';
import 'package:bmicalculator/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeightAgeScreen extends StatelessWidget {
  const WeightAgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiAppCubit,BmiAppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        return  Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Card(
                  elevation: 20,
                  child: Container(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: defaultcontainercolor(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: 'Age'),
                        SizedBox(height: 15.0,),
                        CustomText(text: '${BmiAppCubit.get(context).age}',),
                        SizedBox(height: 15.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'age-',
                              onPressed: (){
                                BmiAppCubit.get(context).agefabiconminus();
                              },
                              child: Icon(
                                Icons.remove,
                              ),

                            ),
                            SizedBox(width: 15.0,),
                            FloatingActionButton(
                              heroTag: 'age+',
                              onPressed: (){
                                BmiAppCubit.get(context).agefabiconplus();

                              },
                              child: Icon(
                                Icons.add,
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
            SizedBox(width: 15.0,),
            Expanded(
              child: Card(
                elevation: 20,
                child: Container(
                  padding: EdgeInsetsDirectional.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: defaultcontainercolor(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: 'Weight'),
                      SizedBox(height: 15.0,),
                      CustomText(text: '${BmiAppCubit.get(context).weight}',),
                      SizedBox(height: 15.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: 'weight-',
                            onPressed: (){
                              BmiAppCubit.get(context).weightfabiconminus();

                            },
                            child: Icon(
                              Icons.remove,
                            ),

                          ),
                          SizedBox(width: 15.0,),
                          FloatingActionButton(
                            heroTag: 'weight+',
                            onPressed: (){
                              BmiAppCubit.get(context).weightfabiconplus();
                            },
                            child: Icon(
                              Icons.add,
                            ),

                          ),

                        ],
                      ),
                    ],
                  ),

                ),
              ),
            ),
          ],
        );
      },

    );
  }
}
