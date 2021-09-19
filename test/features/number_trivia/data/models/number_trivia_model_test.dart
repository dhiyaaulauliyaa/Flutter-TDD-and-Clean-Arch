import 'dart:convert';

import 'package:clean_arch_tdd_ex/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_arch_tdd_ex/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(
    number: 1,
    text: 'Trivia text',
  );

  test(
    'should be a subclass of NumberTrivia entity',
    () async {
      // Assert
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON number is an integer',
      () async {
        // Arrange
        final Map<String, dynamic> jsonMap = jsonDecode(fixture('trivia.json'));

        // Act
        final result = NumberTriviaModel.fromJson(jsonMap);

        // Assert
        expect(result, tNumberTriviaModel);
      },
    );

    test(
      'should return a valid model when the JSON number is regarded as double',
      () async {
        // Arrange
        final Map<String, dynamic> jsonMap =
            jsonDecode(fixture('trivia_double.json'));

        // Act
        final result = NumberTriviaModel.fromJson(jsonMap);

        // Assert
        expect(result, tNumberTriviaModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // Act
        final result = tNumberTriviaModel.toJson();

        // Assert
        final expectedMap = {
          "text": "Trivia text",
          "number": 1,
        };
        expect(result, expectedMap);
      },
    );
  });
}
