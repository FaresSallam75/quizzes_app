class QuestionsModel {
  String? questionId;
  String? questionName;
  String? questionAnswer;

  QuestionsModel({this.questionId, this.questionName, this.questionAnswer});

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'].toString();
    questionName = json['question_name'];
    questionAnswer = json['question_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question_id'] = this.questionId;
    data['question_name'] = this.questionName;
    data['question_answer'] = this.questionAnswer;
    return data;
  }
}