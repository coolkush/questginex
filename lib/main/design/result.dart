import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questginix/common/appbutton.dart';
import 'package:questginix/common/apptext.dart';
import 'package:questginix/main/cubit/questioncubit/logincubit.dart';
import 'package:questginix/main/cubit/questioncubit/loginstate.dart';
import 'package:questginix/main/design/roleselection.dart';
import 'package:questginix/main/mmodel/mainresult.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class ResultPage extends StatefulWidget {
  final ResultMain? model;
  const ResultPage({super.key, required this.model});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubiState(),
      child: BlocBuilder<QuestionCubiState, QuestionState>(
        builder: (context, state) {
          // log("message rebuild");

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
                color: context.read<QuestionCubiState>().isDarkMode()
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
                        AppText(
                            color:
                                context.read<QuestionCubiState>().isDarkMode()
                                    ? Colors.white
                                    : Colors.black,
                            fontWeight: FontWeight.w400,
                            size: 20.sp,
                            text: "Your Score"),
                        AppText(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            size: 30.sp,
                            text: widget.model?.score?.toString() ?? ""),
                        AppText(
                            color:
                                context.read<QuestionCubiState>().isDarkMode()
                                    ? Colors.white
                                    : Colors.black,
                            fontWeight: FontWeight.w400,
                            size: 20.sp,
                            text: "Correct Questions and Answer"),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                widget.model?.correctAnswers?.length ?? 0,
                            itemBuilder: (c, i) {
                              return Container(
                                width: 100.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    2.h.heightBox,
                                    AppText(
                                        color: context
                                                .read<QuestionCubiState>()
                                                .isDarkMode()
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w400,
                                        size: 20.sp,
                                        text: "Question ${i + 1}"),
                                    AppTextPara(
                                        color: context
                                                .read<QuestionCubiState>()
                                                .isDarkMode()
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w400,
                                        size: 16.sp,
                                        text: widget.model?.correctAnswers?[i]
                                                .question ??
                                            ""),
                                    AppText(
                                        color: context
                                                .read<QuestionCubiState>()
                                                .isDarkMode()
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w400,
                                        size: 20.sp,
                                        text: "Correct Answer:"),
                                    AppTextPara(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.w400,
                                        size: 16.sp,
                                        text: widget.model?.correctAnswers?[i]
                                                .answer ??
                                            ""),
                                    2.h.heightBox
                                  ],
                                ),
                              );
                            }),
                        4.h.heightBox,
                        AppButton(
                            isloding: false,
                            butRadius: 25,
                            textColor: Colors.white,
                            buttonName: "Re-Test",
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const RoleSelection()),
                                  (route) => false);
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
