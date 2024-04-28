import 'package:bmicalculator/layouts/bmicalculator_layout.dart';
import 'package:bmicalculator/moduls/loginscreen/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPAge extends StatelessWidget {
  const AuthPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot) {
          if(snapshot.hasData){
            return BmiCalulcatorLayout();
          }

          else{
            return LoginScreen();
          }
        },

      ),
    );
  }
}
