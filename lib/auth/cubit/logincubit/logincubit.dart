import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questginix/auth/cubit/logincubit/loginstate.dart';
import 'package:questginix/auth/design/loginscree.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
  void navigatetologin(BuildContext context, int index) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const SwitchScreen()));
  }

  void updateshowpass() {
    emit(state.copyWith(showpass: !state.showpass));
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
}
