import 'package:bloc/bloc.dart';
import 'package:bmicalculator/moduls/authPage/authPage.dart';
import 'package:bmicalculator/moduls/bmi_results_screen/bmi_result_cubit/cubit.dart';
import 'package:bmicalculator/moduls/loginscreen/logincubit/cubit.dart';
import 'package:bmicalculator/moduls/previous_result_screen/bmi_previous_result_cubit/cubit.dart';
import 'package:bmicalculator/moduls/register_screen/registercubit/cubit.dart';
import 'package:bmicalculator/shared/components/blocobserver.dart';
import 'package:bmicalculator/shared/cubit/bmiappcubit.dart';
import 'package:bmicalculator/shared/styles/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';
import 'moduls/setting_screen/setting_cubit/cubit.dart';
import 'shared/network/local/cachehelper/cachehelper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();

  runApp(MyApp());


}

class MyApp extends StatelessWidget {

  const MyApp({super.key,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) =>BmiAppCubit()..getUserData()),
        BlocProvider(create: (BuildContext context) =>LoginCubit()),
        BlocProvider(create: (BuildContext context) =>RegisterCubit()),
        BlocProvider(create: (BuildContext context) =>BmiResultCubit()),
        BlocProvider(create: (BuildContext context) =>BmiPreviousResultCubit()),
        BlocProvider(create: (BuildContext context) =>SettingCubit()..getUserInfo()),
    ],
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'AlkatraBold',
            primarySwatch:Colors.green,
            primaryColor: Colors.green,
            appBarTheme: AppBarTheme(
              backgroundColor: defaultappcolor(),
              elevation: 0.0,
              titleSpacing: 15.0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: defaultappcolor(),
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
            scaffoldBackgroundColor: Colors.white,
          ),
          home: AuthPAge(),
        ),

    );
  }
}

