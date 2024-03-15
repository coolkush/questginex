import 'package:equatable/equatable.dart';
import 'package:questginix/auth/cubit/logincubit/logincubit.dart';

class ForgotPasswordState extends Equatable {
  final String email;

  final ApiState apistate;
  const ForgotPasswordState({
    this.email = "",
    this.apistate = ApiState.normal,
  });
  @override
  List<Object?> get props => [email, apistate];
  ForgotPasswordState copyWith({
    String? email,
    ApiState? apiState,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      apistate: apiState ?? this.apistate,
    );
  }
}
