import 'package:clean_arch_tdd_ex/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_arch_tdd_ex/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_arch_tdd_ex/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final int? tNumber = 1;
  final NumberTrivia? tNumberTrivia = NumberTrivia(
    text: 'text',
    number: 1,
  );

  test(
    'should get trivia for the number from the repository',
    () async {
      // Arrange
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
          .thenAnswer((_) async => Right(tNumberTrivia));
      
      // Act
      final result = usecase.execute(number: tNumber);

      // Assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);

    },
  );

  /*
  Things to ask
  1. di bagian arrange, gabisa pake any
  2. verify buat apa
  3. kenapa harus pake repository
  4. fungsi usecasenya kok beda yg di pokedex

  */
}
