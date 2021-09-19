import 'package:clean_arch_tdd_ex/core/error/failures.dart';
import 'package:clean_arch_tdd_ex/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_arch_tdd_ex/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;
  
  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure?, NumberTrivia?>> execute ({@required int? number}) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}