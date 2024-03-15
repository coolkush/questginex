import 'package:equatable/equatable.dart';
import 'package:questginix/auth/cubit/logincubit/logincubit.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String confirmPass;
  final bool showpass;
  final bool showconpass;
  final int index;
  final ApiState apistate;
  const LoginState(
      {this.email = "",
      this.confirmPass = "",
      this.apistate = ApiState.normal,
      this.index = 0,
      this.password = "",
      this.showconpass = true,
      this.showpass = true});
  @override
  List<Object?> get props =>
      [email, confirmPass, password, index, apistate, showconpass, showpass];
  LoginState copyWith(
      {String? email,
      String? password,
      int? index,
      ApiState? apiState,
      String? confirmPass,
      bool? showconpass,
      bool? showpass}) {
    return LoginState(
        email: email ?? this.email,
        index: index ?? this.index,
        apistate: apiState ?? this.apistate,
        showconpass: showconpass ?? this.showconpass,
        showpass: showpass ?? this.showpass,
        confirmPass: confirmPass ?? this.confirmPass,
        password: password ?? this.password);
  }
}
