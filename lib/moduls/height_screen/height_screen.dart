import 'package:bmicalculator/shared/components/customtext/customtext.dart';
import 'package:bmicalculator/shared/cubit/bmiappcubit.dart';
import 'package:bmicalculator/shared/cubit/bmiappstates.dart';
import 'package:bmicalculator/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightScreen extends StatelessWidget {
  const HeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiAppCubit,BmiAppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        return Padding(
          padding: const EdgeInsetsDirectional.symmetric(vertical: 15.0),
          child: Card(
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: defaultcontainercolor(),

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'Height',),
                    SizedBox(height: 15.0,),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: '${BmiAppCubit.get(context).height.round()}',),
                        CustomText(text: 'cm', fontsize: 25.0,),
                      ],
                    ),
                    SizedBox(height: 15.0,),
                    Slider(
                      value:BmiAppCubit.get(context).height.toDouble(),
                      min: 90,
                      max:300 ,
                      onChanged: (value){
                        BmiAppCubit.get(context).slidervalue=value.round();
                        BmiAppCubit.get(context).changeslidervalue(BmiAppCubit.get(context).slidervalue);
                      },
                    ),

                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
