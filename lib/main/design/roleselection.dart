import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questginix/auth/cubit/logincubit/logincubit.dart';
import 'package:questginix/common/appbutton.dart';
import 'package:questginix/common/apptext.dart';
import 'package:questginix/common/textfeild.dart';
import 'package:questginix/main/cubit/rolecubit/logincubit.dart';
import 'package:questginix/main/cubit/rolecubit/loginstate.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class RoleSelection extends StatefulWidget {
  const RoleSelection({super.key});

  @override
  State<RoleSelection> createState() => _RoleSelectionState();
}

class _RoleSelectionState extends State<RoleSelection> {
  bool _keyboardVisible = false;

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return BlocProvider(
      create: (context) => RoleselectionCubit(),
      child: BlocBuilder<RoleselectionCubit, RoleselectionState>(
        builder: (context, state) {
          return Scaffold(
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
              child: Container(
                color: context.read<RoleselectionCubit>().isDarkMode()
                    ? Colors.black
                    : Colors.white,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
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
                              color: context
                                      .read<RoleselectionCubit>()
                                      .isDarkMode()
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w400,
                              size: 19.sp,
                              text: "Set Your Preparation Preferences"),
                        ),
                        4.h.heightBox,
                        CustumTextFeild(
                            onPressed: () {},
                            onchangevalue: (p0) {
                              context.read<RoleselectionCubit>().updaterole(p0);
                            },
                            password: false,
                            radius: 5,
                            hintText: "Topic",
                            isdark: context
                                .read<RoleselectionCubit>()
                                .isDarkMode()),
                        2.h.heightBox,
                        CustumTextFeild(
                            // contheight: MediaQuery.of(context).size.height * .09,
                            radius: 5,
                            onPressed: () {},
                            onchangevalue: (p0) {
                              context
                                  .read<RoleselectionCubit>()
                                  .updatelanguage(p0);
                            },
                            password: false,
                            // labtext: "Python, SQL, AWS, Docker",
                            hintText:
                                _keyboardVisible || state.language.isNotEmpty
                                    ? "Languages or Technologies"
                                    : "Python, SQL, AWS, Docker",
                            isdark: context
                                .read<RoleselectionCubit>()
                                .isDarkMode()),
                        2.h.heightBox,
                        DropDownTextFeild(
                            isdark:
                                context.read<RoleselectionCubit>().isDarkMode(),
                            onPressed: () {},
                            controller: controller,
                            password: false,
                            hintText: "Level",
                            myListData: const [
                              "Beginner",
                              "Intermediate",
                              "Advanced",
                              "Expert"
                            ])
                        /* CustumTextFeild(
                              onPressed: () {},
                              onchangevalue: (p0) {
                                context.read<RoleselectionCubit>().updatelevel(p0);
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
                              isdark: context.read<LoginCubit>().isDarkMode()), */

                        ,
                        4.h.heightBox,
                        AppButton(
                            isloding: state.apistate == ApiState.loding,
                            butRadius: 25,
                            textColor: Colors.white,
                            buttonName: "Submit",
                            onPressed: () {
                              context
                                  .read<RoleselectionCubit>()
                                  .loginaction(context, controller);
                            },
                            sizewidth: 50.w)
                      ],
                    ).pOnly(left: 4.w, right: 4.w),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
