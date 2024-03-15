// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class ResultMain {
  num? score;
  List<CorrectAnswers>? correctAnswers;

  ResultMain({this.score, this.correctAnswers});

  ResultMain.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    if (json['correct_answers'] != null) {
      correctAnswers = <CorrectAnswers>[];
      json['correct_answers'].forEach((v) {
        correctAnswers!.add(new CorrectAnswers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    if (this.correctAnswers != null) {
      data['correct_answers'] =
          this.correctAnswers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CorrectAnswers {
  String? question;
  String? answer;

  CorrectAnswers({this.question, this.answer});

  CorrectAnswers.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}
