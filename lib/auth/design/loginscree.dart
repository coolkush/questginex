import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questginix/auth/cubit/logincubit/logincubit.dart';
import 'package:questginix/auth/cubit/logincubit/loginstate.dart';
import 'package:questginix/auth/design/signup.dart';
import 'package:sizer/sizer.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.read<LoginCubit>().isDarkMode()
              ? Colors.black
              : Colors.white,
          body: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Column(
              children: [
                SizedBox(
                  height: 90.h,
                  width: 100.w,
                  child: PageView(
                    controller: PageController(initialPage: state.index),
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
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 8.h,
                  child: Row(
                    children: [
                      Container(
                        height: 10.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color:
                                state.index == 0 ? Colors.grey : Colors.black),
                      ),
                      Container(
                          height: 10.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: state.index == 1
                                  ? Colors.grey
                                  : Colors.black))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
