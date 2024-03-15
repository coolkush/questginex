import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questginix/auth/cubit/forgotpass/loginstate.dart';
import 'package:questginix/auth/cubit/logincubit/logincubit.dart';
import 'package:questginix/auth/design/loginscree.dart';
import 'package:questginix/auth/repository/repo.dart';
import 'package:questginix/common/apptext.dart';
import 'package:sizer/sizer.dart';

class ForgotPassword extends Cubit<ForgotPasswordState> {
  ForgotPassword() : super(const ForgotPasswordState());
  void navigatetologin(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => SwitchScreen(
                  index: index,
                )));
  }

  void updateemail(String val) {
    emit(state.copyWith(email: val));
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
    } else {
      await repo.forgotpass(state.email).then((value) {
        emit(state.copyWith(apiState: ApiState.normal));

        navigatetologin(context, 1);
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
