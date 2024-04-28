import 'package:bmicalculator/shared/components/customtext/customtext.dart';
import 'package:bmicalculator/shared/cubit/bmiappcubit.dart';
import 'package:bmicalculator/shared/cubit/bmiappstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiAppCubit,BmiAppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return  Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: (){
                  BmiAppCubit.get(context).malepressed();
                },
                child: Card(
                  elevation: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color:BmiAppCubit.get(context).ismale?Colors.green:Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage('assets/images/male.png'),),
                        SizedBox(height: 10.0,),
                        CustomText(text: 'Male',),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 15.0,),
            Expanded(
              child: InkWell(
                onTap: (){
                  BmiAppCubit.get(context).femalepressed();
                },
                child: Card(
                  elevation: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:BmiAppCubit.get(context).ismale?Colors.grey[200]:Colors.green,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage('assets/images/female.png'),),
                        SizedBox(height: 10.0,),
                        CustomText(text: 'Female',),
                      ],
                    ),
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
