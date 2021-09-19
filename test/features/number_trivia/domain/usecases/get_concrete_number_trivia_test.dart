import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_arch_tdd_ex/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_arch_tdd_ex/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:clean_arch_tdd_ex/features/number_trivia/domain/entities/number_trivia.dart';

import 'get_concrete_number_trivia_test.mocks.dart';

@GenerateMocks([NumberTriviaRepository])
void main() {
  final mockNumberTriviaRepository = MockNumberTriviaRepository();
  final usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');
  final tNumber = 1;

  test(
    'should get trivia for the number from the repository',
    () async {
      // arrange
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(1))
          .thenAnswer((_) async => Right(tNumberTrivia));

      // act
      final result = await usecase(Params(number: 1));

      // assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}

  /*
  Things to ask
  1. di bagian arrange, gabisa pake any
  2. verify buat apa
  3. kenapa harus pake repository
  4. fungsi usecasenya kok beda yg di pokedex
  */