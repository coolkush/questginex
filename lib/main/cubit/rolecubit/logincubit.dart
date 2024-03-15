// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questginix/auth/cubit/logincubit/logincubit.dart';
import 'package:questginix/auth/design/loginscree.dart';
import 'package:questginix/auth/repository/repo.dart';
import 'package:questginix/common/apptext.dart';
import 'package:questginix/main/cubit/rolecubit/loginstate.dart';
import 'package:questginix/main/design/question.dart';
import 'package:questginix/main/repo/repo.dart';

import 'package:sizer/sizer.dart';

class RoleselectionCubit extends Cubit<RoleselectionState> {
  RoleselectionCubit() : super(const RoleselectionState());
  void navigatetologin(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => SwitchScreen(
                  index: index,
                )));
  }

  void updaterole(String val) {
    emit(state.copyWith(role: val));
  }

  void updatelanguage(String val) {
    emit(state.copyWith(language: val));
  }

  void updatelevel(String val) {
    emit(state.copyWith(level: val));
  }

  bool isDarkMode() {
    final darkMode = WidgetsBinding.instance.window.platformBrightness;
    if (darkMode == Brightness.dark) {
      return true;
    } else {
      return false;
    }
  }

  void loginaction(
      BuildContext context, TextEditingController controller) async {
    emit(state.copyWith(apiState: ApiState.loding));
    RolesRepository repo = RolesRepository();
    if (state.role.isEmpty) {
      emit(state.copyWith(apiState: ApiState.normal));
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: AppText(
                    fontWeight: FontWeight.w500,
                    size: 12.sp,
                    text: "Please Enter Topic"),
              ));
    } else if (state.language.isEmpty) {
      emit(state.copyWith(apiState: ApiState.normal));
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: AppText(
                    fontWeight: FontWeight.w500,
                    size: 12.sp,
                    text: "Please Enter Languages"),
              ));
    } else if (controller.text.isEmpty) {
      emit(state.copyWith(apiState: ApiState.normal));
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: AppText(
                    fontWeight: FontWeight.w500,
                    size: 12.sp,
                    text: "Please Select your Level"),
              ));
    } else {
      try {
        final response =
            await repo.question(state.role, state.language, controller.text);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => QuestionAnswer(question: response.question)));
      } catch (e) {
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
}
