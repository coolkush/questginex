import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questginix/auth/cubit/logincubit/logincubit.dart';
import 'package:questginix/auth/cubit/logincubit/loginstate.dart';
import 'package:questginix/auth/design/signup.dart';
import 'package:questginix/common/apptext.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class SwitchScreen extends StatefulWidget {
  final int index;
  const SwitchScreen({super.key, required this.index});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  void initState() {
    context.read<LoginCubit>().updateindex(widget.index);

    super.initState();
    c = PageController(initialPage: widget.index);
  }

  PageController? c;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.read<LoginCubit>().isDarkMode()
              ? Colors.black
              : Colors.white,
          body: DoubleBackToCloseApp(
            snackBar: SnackBar(
              backgroundColor: Colors.black,
              content: Text(
                "Tap back again to leave",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 1.5.h,
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            child: SizedBox(
              height: 100.h,
              width: 100.w,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        height: 90.h,
                        width: 100.w,
                        child: PageView.builder(
                            controller: c,
                            itemCount: 2,
                            // restorationId: ,
                            onPageChanged: (value) {
                              context.read<LoginCubit>().updateindex(value);
                            },
                            itemBuilder: (c, i) {
                              return LoginScreen(
                                index: i,
                              );
                            })
                        /*   PageView(
                        controller: c,
                        
                        onPageChanged: (value) {
                          context.read<LoginCubit>().updateindex(value);
                        },
                        children: [
                          LoginScreen(
                            index: state.index,
                          ),
                          LoginScreen(
                            index: state.index,
                          )
                        ],
                      ), */
                        ),
                    Container(
                      width: 100.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(color: Colors.grey),
                          color: Colors.grey[300]),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  // bottomSelectedIndex = index;
                                  c!.animateToPage(0,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                });
                              },
                              child: Container(
                                height: 10.h,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(13),
                                        bottomLeft: Radius.circular(13)),
                                    border: Border.all(color: Colors.grey),
                                    color: state.index == 0
                                        ? Colors.grey
                                        : Colors.black),
                                child: AppText(
                                  fontWeight: FontWeight.w400,
                                  size: 20.sp,
                                  text: "Create Account",
                                  color: Colors.white,
                                ).centered(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  // bottomSelectedIndex = index;
                                  c!.animateToPage(1,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                });
                              },
                              child: Container(
                                height: 10.h,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(13),
                                        bottomRight: Radius.circular(13)),
                                    color: state.index == 1
                                        ? Colors.grey
                                        : Colors.black),
                                child: AppText(
                                  fontWeight: FontWeight.w400,
                                  size: 20.sp,
                                  text: "Login",
                                  color: Colors.white,
                                ).centered(),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
