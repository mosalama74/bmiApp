import 'package:bmicalculator/models/usermodel/usermodel.dart';
import 'package:bmicalculator/moduls/setting_screen/setting_cubit/cubit.dart';
import 'package:bmicalculator/moduls/setting_screen/setting_cubit/states.dart';
import 'package:bmicalculator/shared/components/customt_text_form_field/custom_text_form_field.dart';
import 'package:bmicalculator/shared/components/customtext/customtext.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  var emailcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SettingCubit cubitOb = SettingCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formkey,
              child: ConditionalBuilder(
                  condition: cubitOb.userInfo.length > 0,
                  builder: (context) => ListView.builder(
                    itemBuilder: (context, index) =>
                        buildItem(cubitOb.userInfo[index], context),
                    itemCount: cubitOb.userInfo.length,
                  ),
                  fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
        );
      },
    );
  }

  Widget buildItem(UserModel model, context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              CustomTextFormField(
                hintText: '${model.name}',
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
                controller: namecontroller,
                prefixIconcolor: Colors.green,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 15),
                child: CustomTextFormField(
                  hintText: '${model.email}',
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailcontroller,
                  prefixIconcolor: Colors.green,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      SettingCubit.get(context).updateUserInfo(
                          name: namecontroller.text, email: emailcontroller.text);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Edit',
                        textcolor: Colors.green,
                        fontsize: 25,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

        ],
      );
}
