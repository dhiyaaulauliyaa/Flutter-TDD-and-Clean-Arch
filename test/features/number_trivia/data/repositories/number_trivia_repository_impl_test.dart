import 'package:clean_arch_tdd_ex/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_arch_tdd_ex/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:clean_arch_tdd_ex/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:clean_arch_tdd_ex/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:clean_arch_tdd_ex/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:clean_arch_tdd_ex/core/platform/network_info.dart';
import 'package:mockito/mockito.dart';

import 'number_trivia_repository_impl_test.mocks.dart';

@GenerateMocks([NumberTriviaRemoteDataSource])
@GenerateMocks([NumberTriviaLocalDataSource])
@GenerateMocks([NetworkInfo])
void main() {
  final mockRemoteDataSource = MockNumberTriviaRemoteDataSource();
  final mockLocalDataSource = MockNumberTriviaLocalDataSource();
  final mockNetworkInfo = MockNetworkInfo();
  final repository = NumberTriviaRepositoryImpl(
    remoteDataSource: mockRemoteDataSource,
    localDataSource: mockLocalDataSource,
    networkInfo: mockNetworkInfo,
  );

  group('getConcreteNumberTrivia', () {
    final tNumber = 1;

    /* Check network info */
    test(
      'should check if the device is online',
      () async {
        // Arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

        // Act
        // repository.getConcreteNumberTrivia(tNumber);

        // Assert
        // verify(mockNetworkInfo.isConnected);
      },
    );
  });

  /* Check when device online */
  group('device is online', () {
    final tNumber = 1;
    final tNumberTriviaModel = NumberTriviaModel(
      text: 'Trivia text',
      number: 1,
    );
    final NumberTrivia tNumberTrivia = tNumberTriviaModel;

    setUp(() => () {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        });

    /* Get remote data */
    test(
      'should return remote data (number trivia) when device is online',
      () async {
        // Arrange
        when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber)).thenAnswer(
          (_) async => tNumberTriviaModel,
        );

        // Act
        final result = await repository.getConcreteNumberTrivia(tNumber);

        // Assert
        verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
        expect(result, equals(Right(tNumberTrivia)));
      },
    );
    
   
  });

  /* Check when device offline */
  group('device is offline', () {
    setUp(() => () {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        });
  });
}
