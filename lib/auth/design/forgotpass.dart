import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questginix/auth/cubit/forgotpass/logincubit.dart';
import 'package:questginix/auth/cubit/forgotpass/loginstate.dart';
import 'package:questginix/auth/cubit/logincubit/logincubit.dart';
import 'package:questginix/common/appbutton.dart';
import 'package:questginix/common/apptext.dart';
import 'package:questginix/common/textfeild.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPassword(),
      child: Scaffold(
        backgroundColor: context.read<LoginCubit>().isDarkMode()
            ? Colors.black
            : Colors.white,
        body: BlocBuilder<ForgotPassword, ForgotPasswordState>(
          builder: (context, state) {
            return SafeArea(
              child: SizedBox(
                height: 100.h,
                width: 100.w,
                child: Column(
                  children: [
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [Color(0xff8197ea), Color(0xff49c4c9)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.srcATop,
                      child: AppText(
                          fontWeight: FontWeight.w500,
                          size: 35.sp,
                          text: "Questgenix"),
                    ),
                    5.h.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                          color: context.read<ForgotPassword>().isDarkMode()
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w400,
                          size: 26.sp,
                          text: "Forgot Password"),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                          color: context.read<ForgotPassword>().isDarkMode()
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w400,
                          size: 12.sp,
                          text:
                              "Forgot Your password enter your registed email "),
                    ),
                    4.h.heightBox,
                    CustumTextFeild(
                        onPressed: () {},
                        onchangevalue: (p0) {
                          context.read<ForgotPassword>().updateemail(p0);
                        },
                        password: false,
                        hintText: "Email",
                        isdark: context.read<ForgotPassword>().isDarkMode()),
                    4.h.heightBox,
                    AppButton(
                        isloding: state.apistate == ApiState.loding,
                        butRadius: 25,
                        textColor: Colors.white,
                        buttonName: "Get Started",
                        onPressed: () {
                          context.read<ForgotPassword>().loginaction(context);
                        },
                        sizewidth: 50.w)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
