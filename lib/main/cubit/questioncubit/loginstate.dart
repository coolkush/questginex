import 'package:equatable/equatable.dart';
import 'package:questginix/auth/cubit/logincubit/logincubit.dart';
import 'package:questginix/main/mmodel/genratequestion.dart';

class QuestionState extends Equatable {
  final String ans;
  final num index;
  final List<GenrateAnswer>? answer;
  final ApiState apistate;
  const QuestionState({
    this.index = 0,
    this.ans = "",
    this.answer,
    this.apistate = ApiState.normal,
  });
  @override
  List<Object?> get props => [ans, index, answer, apistate];
  QuestionState copyWith({
    String? ans,
    List<GenrateAnswer>? answer,
    num? index,
    ApiState? apiState,
  }) {
    return QuestionState(
      ans: ans ?? this.ans,
      index: index ?? this.index,
      answer: answer,
      apistate: apiState ?? this.apistate,
    );
  }
}
