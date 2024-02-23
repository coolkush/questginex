import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:questginix/auth/cubit/logincubit/logincubit.dart';
import 'package:questginix/common/appbutton.dart';
import 'package:questginix/common/apptext.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({super.key});

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => LoginCubit(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff8197ea), Color(0xff49c4c9)])),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                    maxlin: 2,
                    fontWeight: FontWeight.w600,
                    size: 42.sp,
                    text: "Ace Your\nInterviews"),
                2.h.heightBox,
                AppText(
                        maxlin: 2,
                        fontWeight: FontWeight.w400,
                        size: 16.sp,
                        text: "Prepare with the real interview question")
                    .centered(),
                AppText(
                        maxlin: 2,
                        fontWeight: FontWeight.w400,
                        size: 16.sp,
                        text: "pratice with AI,and I and your dream job! ")
                    .centered(),
                5.h.heightBox,
                AppButton(
                  buttonName: 'Get Started',
                  onPressed: () =>
                      context.read<LoginCubit>().navigatetologin(context, 0),
                  textColor: Colors.white,
                  sizewidth: 50.w,
                ).centered(),
                5.h.heightBox,
                RichText(
                    text: TextSpan(
                        text: "Already have an account?",
                        style: GoogleFonts.abyssinicaSil(fontSize: 12.sp),
                        children: [
                      TextSpan(
                          text: " Log in",
                          style: GoogleFonts.abyssinicaSil(fontSize: 12.sp),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context
                                  .read<LoginCubit>()
                                  .navigatetologin(context, 1);
                            })
                    ])).centered()
              ],
            ).pOnly(left: 4.w, right: 4.w),
          ),
        ),
      ),
    );
  }
}
