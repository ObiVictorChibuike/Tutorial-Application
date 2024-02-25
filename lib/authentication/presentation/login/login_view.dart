import 'package:auth_test/commons/widgets/generic_button.dart';
import 'package:auth_test/commons/widgets/generic_textfield.dart';
import 'package:auth_test/commons/widgets/spacing.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body:  Form(
        key: loginFormKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 18),
          children: [
            const YMargin(50),
            const Text("Login", style: TextStyle(fontSize: 28, color: Colors.black)),
            const YMargin(8),
            const Text("Provide your details to get started", style: TextStyle(fontSize: 14, color: Colors.black)),
            const YMargin(40),
            GenericTextField(
              fieldName: "Email Address",
              controller: emailController,
              validator: (value){
                if(value!.isEmpty){
                  return "Please enter email";
                }
                return null;
              },
            ),
            GenericTextField(
              textFieldBottomPadding: 10,
              obscureText: true,
              textFieldType: TextFieldType.password,
              fieldName: "Password",
              hintText: "*********",
              controller: passwordController,
              validator: (value){
                if(value!.isEmpty){
                  return "Please enter password";
                }else if(value.length != 8){
                  return "Password must be 8 characters";
                }
                return null;
              },
            ),
            Align(alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: (){

                },
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const YMargin(40),
            GestureDetector(
              onTap: (){
                if(loginFormKey.currentState!.validate()){

                }
              },
              child: GenericButton(
                btnIcon: Text("Login", style: TextStyle(color: Colors.white),),
              ),
            ),
            const YMargin(24),

          ],
        ),
      ),
    );
  }
}
