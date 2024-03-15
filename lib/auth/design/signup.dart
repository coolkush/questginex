import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questginix/auth/cubit/logincubit/logincubit.dart';
import 'package:questginix/auth/cubit/logincubit/loginstate.dart';
import 'package:questginix/auth/design/forgotpass.dart';
import 'package:questginix/common/appbutton.dart';
import 'package:questginix/common/apptext.dart';
import 'package:questginix/common/textfeild.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  final int index;
  const LoginScreen({super.key, required this.index});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
        return Container(
          color: context.read<LoginCubit>().isDarkMode()
              ? Colors.black
              : Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
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
                      color: context.read<LoginCubit>().isDarkMode()
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.w400,
                      size: 26.sp,
                      text: widget.index == 1
                          ? "Welcome Back"
                          : "Create Account"),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                      color: context.read<LoginCubit>().isDarkMode()
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.w400,
                      size: 12.sp,
                      text: widget.index == 1
                          ? "Fill out the informtion below in order to access your account"
                          : "Let's get started by filling out he form below"),
                ),
                4.h.heightBox,
                CustumTextFeild(
                    onPressed: () {},
                    onchangevalue: (p0) {
                      context.read<LoginCubit>().updateemail(p0);
                    },
                    password: false,
                    hintText: "Email",
                    isdark: context.read<LoginCubit>().isDarkMode()),
                2.h.heightBox,
                CustumTextFeild(
                    onPressed: () {},
                    onchangevalue: (p0) {
                      context.read<LoginCubit>().updatepassword(p0);
                    },
                    password: state.showpass,
                    suxifIcon: Icon(
                      state.showpass == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: context.read<LoginCubit>().isDarkMode()
                          ? Colors.white
                          : Colors.black,
                    ).onTap(() {
                      context.read<LoginCubit>().updateshowpass();
                    }),
                    hintText: "password",
                    isdark: context.read<LoginCubit>().isDarkMode()),
                widget.index == 1 ? Container() : 2.h.heightBox,
                widget.index == 1
                    ? Container()
                    : CustumTextFeild(
                        onPressed: () {},
                        onchangevalue: (p0) {
                          context.read<LoginCubit>().updatepasswordconf(p0);
                        },
                        suxifIcon: Icon(
                          state.showconpass == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: context.read<LoginCubit>().isDarkMode()
                              ? Colors.white
                              : Colors.black,
                        ).onTap(() {
                          context.read<LoginCubit>().updateshowconfpass();
                        }),
                        password: state.showconpass,
                        hintText: "Confirm Password",
                        isdark: context.read<LoginCubit>().isDarkMode()),
                2.h.heightBox,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const Forgotpassword()));
                      },
                      child: AppText(
                          color: context.read<LoginCubit>().isDarkMode()
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w400,
                          size: 16.sp,
                          text: "Forgot Password")),
                ),
                4.h.heightBox,
                AppButton(
                    isloding: state.apistate == ApiState.loding,
                    butRadius: 25,
                    textColor: Colors.white,
                    buttonName: "Get Started",
                    onPressed: () {
                      context.read<LoginCubit>().loginaction(context);
                    },
                    sizewidth: 50.w)
              ],
            ).pOnly(left: 4.w, right: 4.w),
          ),
        );
      }),
    );
  }
}
