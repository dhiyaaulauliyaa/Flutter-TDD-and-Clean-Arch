import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_arch_tdd_ex/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_arch_tdd_ex/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:clean_arch_tdd_ex/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_arch_tdd_ex/core/usecases/usecases.dart';

import 'get_concrete_number_trivia_test.mocks.dart';

@GenerateMocks([NumberTriviaRepository])
void main() {
  final mockNumberTriviaRepository = MockNumberTriviaRepository();
  final usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia (for the random number) from the repository',
    () async {
      // arrange
      when(mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => Right(tNumberTrivia));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getRandomNumberTrivia());
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