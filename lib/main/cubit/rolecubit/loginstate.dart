import 'package:equatable/equatable.dart';
import 'package:questginix/auth/cubit/logincubit/logincubit.dart';

class RoleselectionState extends Equatable {
  final String role;
  final String language;
  final String level;

  final ApiState apistate;
  const RoleselectionState({
    this.role = "",
    this.language = "",
    this.level = "",
    this.apistate = ApiState.normal,
  });
  @override
  List<Object?> get props => [role, level, language, apistate];
  RoleselectionState copyWith({
    String? role,
    String? language,
    String? level,
    ApiState? apiState,
  }) {
    return RoleselectionState(
      role: role ?? this.role,
      level: level ?? this.level,
      language: language ?? this.language,
      apistate: apiState ?? this.apistate,
    );
  }
}
