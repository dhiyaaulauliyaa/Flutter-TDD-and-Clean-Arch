import 'package:clean_arch_tdd_ex/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:meta/meta.dart';

class NumberTriviaModel extends NumberTrivia {
  final String? text;
  final int? number;

  NumberTriviaModel({
    @required this.text,
    @required this.number,
  }) : super(number: number, text: text);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
      text: json['text'],
      number: (json['number'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "number": number,
    };
  }
}
