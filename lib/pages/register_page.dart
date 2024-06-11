import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/cubit/auth_cubit.dart';
import 'package:demo_futsalapp/cubit/page_cubit.dart';
import 'package:demo_futsalapp/widgets/custom_text_form_field.dart';
import 'package:demo_futsalapp/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController hobiController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget titleSection() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 44),
        child: Text(
          "Register an Account",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget formSection() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              title: "Full Name",
              hintText: "Enter Name",
              controller: nameController,
            ),
            CustomTextFormField(
              title: "Email",
              hintText: "Enter Email",
              controller: emailController,
            ),
            CustomTextFormField(
              title: "Password",
              hintText: "Enter Password",
              isObscure: true,
              controller: passwordController,
            ),
            CustomTextFormField(
              title: "Hobby",
              hintText: "Enter your Hobby",
              controller: hobiController,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  context.read<PageCubit>().setPage(0);
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'main-page', (route) => false);
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kGreenLightColor,
                      content: Text(state.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return MyButton(
                  onTap: () {
                    context.read<AuthCubit>().signUp(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        hobby: hobiController.text);
                  },
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 55,
                  text: "Register",
                );
              },
            ),
          ],
        ),
      );
    }

    Widget loginSection() {
      return Container(
        margin: EdgeInsets.only(bottom: 50, top: 30),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'login-page');
          },
          child: Text(
            "Already have an account? Log in",
            style: lightTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            titleSection(),
            formSection(),
            loginSection(),
          ],
        ),
      ),
    );
  }
}
