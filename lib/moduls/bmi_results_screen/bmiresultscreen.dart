import 'package:bmicalculator/shared/components/customButton/custombutton.dart';
import 'package:bmicalculator/shared/components/customtext/customtext.dart';
import 'package:bmicalculator/shared/cubit/bmiappcubit.dart';
import 'package:bmicalculator/shared/cubit/bmiappstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

import '../previous_result_screen/previous_result_screen.dart';

class BmiResultScreen extends StatelessWidget {

   BmiResultScreen({
     required this.gender,
     required this.age,
     required this.height,
     required this.weight,
     required this.result,
  });

    String gender;
    int age;
    int height;
    int weight;
    double result;



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiAppCubit,BmiAppStates>(
      listener: (BuildContext context, state) {

      },
      builder: (BuildContext context, Object? state) {
        BmiAppCubit cubitOb = BmiAppCubit.get(context);
        BmiAppCubit.get(context).bmiConclusion(result: result);
        return Scaffold(
          appBar: AppBar(
            title: CustomText(
              text: 'BmiResults',
              fontsize:25.0,
            ),
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: PrettyGauge(
                    gaugeSize: 200,
                    minValue: 0.0,
                    maxValue: 40.0,
                    segments: [
                      GaugeSegment('Underweight', 18.5, Colors.red),
                      GaugeSegment('Normal', 6.4, Colors.green),
                      GaugeSegment('Overweight', 5, Colors.orange),
                      GaugeSegment('Obesity', 10.1, Colors.pink),

                    ],
                    valueWidget: Text( '${BmiAppCubit.get(context).result.toInt()}',style: TextStyle(fontSize: 20),),
                    needleColor: Colors.green,
                    currentValue: BmiAppCubit.get(context).result,
                    displayWidget: Text('Bmi ', style: TextStyle(fontSize: 20,),),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'Gender : '),
                    SizedBox(width: 10.0,),
                    CustomText(text: gender),
                  ],
                ),
                SizedBox(height: 15.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'Age : '),
                    SizedBox(width: 10.0,),
                    CustomText(text: '${age}'),
                  ],
                ),
                SizedBox(height: 15.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'Height : '),
                    SizedBox(width: 10.0,),
                    CustomText(text: '${height}'),
                  ],
                ),
                SizedBox(height: 15.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'Weight : '),
                    SizedBox(width: 10.0,),
                    CustomText(text: '${weight}'),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'Result : '),
                    SizedBox(width: 10.0,),
                    CustomText(text: '${result.round()}'),
                  ],
                ),
                SizedBox(height: 30.0,),
                CustomText(text: '${cubitOb.bmiStatus}',fontsize: 25,textcolor: cubitOb.bmiStatusColor,),
                SizedBox(height: 10.0,),
                CustomText(text: '${cubitOb.bmiMessage}',fontsize: 25,),

                SizedBox(height: 20.0,),
                CustomMaterialButton(
                  child: CustomText(
                    text: 'Calculate Again',
                    fontsize: 25.0,
                  ),
                  onPressed: () { Navigator.pop(context); },
                ),
              ],
            ),
          ),
        );
      },

    );
  }




}
