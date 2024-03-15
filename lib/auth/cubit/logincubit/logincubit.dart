import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questginix/auth/cubit/logincubit/loginstate.dart';
import 'package:questginix/auth/design/loginscree.dart';
import 'package:questginix/auth/repository/repo.dart';
import 'package:questginix/common/apptext.dart';
import 'package:questginix/main/design/roleselection.dart';
import 'package:sizer/sizer.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
  void navigatetologin(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => SwitchScreen(
                  index: index,
                )));
  }

  void updateshowpass() {
    emit(state.copyWith(showpass: !state.showpass));
  }

  void updatepassword(String val) {
    emit(state.copyWith(password: val));
  }

  void updatepasswordconf(String val) {
    emit(state.copyWith(confirmPass: val));
  }

  void updateemail(String val) {
    emit(state.copyWith(email: val));
  }

  void updateindex(int index) {
    emit(state.copyWith(index: index));
  }

  void updateshowconfpass() {
    emit(state.copyWith(showconpass: !state.showconpass));
  }

  bool isDarkMode() {
    final darkMode = WidgetsBinding.instance.window.platformBrightness;
    if (darkMode == Brightness.dark) {
      return true;
    } else {
      return false;
    }
  }

  void loginaction(BuildContext context) async {
    Repoitory repo = Repoitory();
    emit(state.copyWith(apiState: ApiState.loding));
    if (state.email.isEmpty) {
      emit(state.copyWith(apiState: ApiState.normal));
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: AppText(
                    fontWeight: FontWeight.w500,
                    size: 12.sp,
                    text: "Please Enter email id"),
              ));
    } else if (state.index == 0) {
      if (state.password.isEmpty) {
        emit(state.copyWith(apiState: ApiState.normal));
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: AppText(
                      fontWeight: FontWeight.w500,
                      size: 12.sp,
                      text: "Please Enter password"),
                ));
      } else if (state.confirmPass.isEmpty) {
        emit(state.copyWith(apiState: ApiState.normal));
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: AppText(
                      fontWeight: FontWeight.w500,
                      size: 12.sp,
                      text: "Please Enter confirm pass"),
                ));
      } else if (state.password.toString() != state.confirmPass.toString()) {
        log("${state.password.toString()} != ${state.confirmPass.toString()}");
        emit(state.copyWith(apiState: ApiState.normal));
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: AppText(
                      fontWeight: FontWeight.w500,
                      size: 12.sp,
                      text: "Password and confirm password must be same"),
                ));
      } else {
        await repo.createAccount(state.email, state.password).then((value) {
          emit(state.copyWith(apiState: ApiState.normal));

          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(builder: (_) => const RoleSelection()),
          //     (route) => false);
        }).onError((error, stackTrace) {
          emit(state.copyWith(apiState: ApiState.normal));
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: AppText(
                        fontWeight: FontWeight.w500,
                        size: 12.sp,
                        text: error.toString()),
                  ));
        });
      }
    } else {
      if (state.password.isEmpty) {
        emit(state.copyWith(apiState: ApiState.normal));
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: AppText(
                      fontWeight: FontWeight.w500,
                      size: 12.sp,
                      text: "Please Enter password"),
                ));
      } else {
        await repo.logIn(state.email, state.password).then((value) {
          emit(state.copyWith(apiState: ApiState.normal));

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const RoleSelection()),
              (route) => false);
        }).onError((error, stackTrace) {
          emit(state.copyWith(apiState: ApiState.normal));
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: AppText(
                        fontWeight: FontWeight.w500,
                        size: 12.sp,
                        text: error.toString()),
                  ));
        });
      }
    }
  }
}

enum ApiState { loding, normal }
