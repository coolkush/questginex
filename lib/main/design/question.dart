import 'dart:developer';

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questginix/auth/cubit/logincubit/logincubit.dart';
import 'package:questginix/common/appbutton.dart';
import 'package:questginix/common/apptext.dart';
import 'package:questginix/common/textfeild.dart';
import 'package:questginix/main/cubit/questioncubit/logincubit.dart';
import 'package:questginix/main/cubit/questioncubit/loginstate.dart';
import 'package:questginix/main/cubit/rolecubit/logincubit.dart';
import 'package:questginix/main/mmodel/genratequestion.dart';
import 'package:sizer/sizer.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'package:velocity_x/velocity_x.dart';

class QuestionAnswer extends StatefulWidget {
  final List question;
  const QuestionAnswer({super.key, required this.question});

  @override
  State<QuestionAnswer> createState() => _QuestionAnswerState();
}

class _QuestionAnswerState extends State<QuestionAnswer> {
  TextEditingController controller = TextEditingController();
  stt.SpeechToText _speech = stt.SpeechToText();
  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => log('onStatus: $val'),
        onError: (val) => log('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            controller.text = val.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  bool _isListening = false;

  @override
  void initState() {
    super.initState();
  }

  List<GenrateAnswer> data = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubiState(),
      child: BlocBuilder<QuestionCubiState, QuestionState>(
        builder: (context, state) {
          // log("message rebuild");
          controller.clear();
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
                            size: 19.sp,
                            text:
                                "Question ${state.index + 1}/${widget.question.length}"),
                        AppTextPara(
                            color:
                                context.read<QuestionCubiState>().isDarkMode()
                                    ? Colors.white
                                    : Colors.black,
                            fontWeight: FontWeight.w400,
                            size: 19.sp,
                            text: widget.question[state.index.toInt()]),
                        4.h.heightBox,
                        CustumTextFeild(
                            onPressed: () {},
                            maxlenght: 6,
                            onchangevalue: (p0) {
                              // context.read<QuestionCubiState>().updaterole(p0);
                            },
                            controller: controller,
                            suxifIcon: Icon(
                              _isListening ? Icons.mic_off : Icons.mic,
                              color:
                                  context.read<QuestionCubiState>().isDarkMode()
                                      ? Colors.white
                                      : Colors.black,
                            ).onTap(_listen),
                            password: false,
                            radius: 5,
                            hintText: "Enter your answer",
                            isdark:
                                context.read<QuestionCubiState>().isDarkMode()),
                        4.h.heightBox,
                        AppButton(
                            isloding: state.apistate == ApiState.loding,
                            butRadius: 25,
                            textColor: Colors.white,
                            buttonName: "Submit",
                            onPressed: () {
                              log("${state.answer}");

                              if (controller.text.isNotEmpty) {
                                if (state.index != widget.question.length - 1) {
                                  context.read<QuestionCubiState>().updateIndex(
                                      state.index + 1,
                                      GenrateAnswer(
                                          question: widget
                                              .question[state.index.toInt()],
                                          answer: controller.text));
                                } else {
                                  context.read<QuestionCubiState>().loginaction(
                                      context,
                                      GenrateAnswer(
                                          question: widget
                                              .question[state.index.toInt()],
                                          answer: controller.text));
                                }
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: AppText(
                                              fontWeight: FontWeight.w500,
                                              size: 12.sp,
                                              text: "Please Enter your answer"),
                                        ));
                              }
                              // }
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




/* 

{"qa_pairs": [{"question": "What is the main purpose of using Dart programming language?", "answer": "sdada"}, {"question": "How does Dart differ from other programming languages?", "answer": "sdsdsd"}, {"question": "Can you explain the key features of the Dart language?", "answer": "sdsdsd"}, {"question": "What is Flutter and how does it relate to Dart?", "answer": "dsdsdsd"}, {"question": "How does Dart help in building mobile applications using Flutter?", answer: dsdsds}, {question: What are the different data types supported by Dart?, answer: dsdsdsd}, {question: How does Dart handle asynchronous programming?, answer: dsdsdsds}, {question: Can you explain the concept of classes and objects in Dart?, answer: dsdsds}, {question: What are the different ways to handle errors and exceptions in Dart?, answer: sdsdsdsdsd}, {question: How does Dart support functional programming?, answer: sdsdsdsdsdsd}]}
 */