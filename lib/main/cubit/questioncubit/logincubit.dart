import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questginix/auth/cubit/forgotpass/loginstate.dart';
import 'package:questginix/auth/cubit/logincubit/logincubit.dart';
import 'package:questginix/auth/design/loginscree.dart';
import 'package:questginix/auth/repository/repo.dart';
import 'package:questginix/common/apptext.dart';
import 'package:questginix/main/cubit/questioncubit/loginstate.dart';
import 'package:questginix/main/design/result.dart';
import 'package:questginix/main/mmodel/genratequestion.dart';
import 'package:questginix/main/repo/repo.dart';
import 'package:sizer/sizer.dart';

class QuestionCubiState extends Cubit<QuestionState> {
  QuestionCubiState() : super(const QuestionState());
  void navigatetologin(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => SwitchScreen(
                  index: index,
                )));
  }

  void updateIndex(num val, GenrateAnswer answer) {
    List<GenrateAnswer> answerList = state.answer ?? [];
    answerList.add(answer);
    emit(state.copyWith(index: val, answer: answerList));
  }

  void poplastindex() {
    List<GenrateAnswer> answerList = state.answer ?? [];
    answerList.removeAt(answerList.length >= 1 ? answerList.length - 1 : 0);
    emit(state.copyWith(answer: []));
  }

  bool isDarkMode() {
    final darkMode = WidgetsBinding.instance.window.platformBrightness;
    if (darkMode == Brightness.dark) {
      return true;
    } else {
      return false;
    }
  }

  void loginaction(BuildContext context, GenrateAnswer answer) async {
    List<GenrateAnswer> answerList = state.answer ?? [];
    answerList.add(answer);
    RolesRepository repo = RolesRepository();
    emit(state.copyWith(apiState: ApiState.loding));
    try {
      final response = await repo.result(answerList);
      emit(state.copyWith(apiState: ApiState.normal));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => ResultPage(
                    model: response,
                  )),
          (route) => false);
    } catch (e) {
      emit(state.copyWith(apiState: ApiState.normal));
      poplastindex();
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: AppText(
                    fontWeight: FontWeight.w500,
                    size: 12.sp,
                    text: e.toString()),
              ));
    }
  }
}
