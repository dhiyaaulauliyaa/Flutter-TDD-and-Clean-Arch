import 'package:clean_arch_tdd_ex/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/platform/network_info.dart';
import '../../../../core/error/failures.dart';

import '../../domain/entities/number_trivia.dart';
import '../../domain/repositories/number_trivia_repository.dart';

import '../datasources/number_trivia_local_data_source.dart';
import '../datasources/number_trivia_remote_data_source.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure?, NumberTrivia?>> getConcreteNumberTrivia(
    int? number,
  ) async {
    networkInfo.isConnected;
    
    final remoteTrivia = await remoteDataSource.getConcreteNumberTrivia(
      number,
    );

    localDataSource.cacheNumberTrivia(remoteTrivia as NumberTriviaModel);

    return Right(remoteTrivia);
  }

  @override
  Future<Either<Failure?, NumberTrivia?>> getRandomNumberTrivia() {
    throw UnimplementedError();
  }
}
