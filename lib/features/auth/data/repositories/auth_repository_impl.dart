import 'package:blog/core/error/exceptions.dart';
import 'package:blog/core/error/failures.dart';
import 'package:blog/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

//esse repositório implementa o repoistório (interface) criado na camada de domain

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource
      remoteDataSource; //atraves do remotedatasource, chama as funções da interface
  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> loginWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );

      return right(
          userId); //fpdart package: right significa que retornou um sucesso + valor userid
    } on ServerException catch (e) {
      //diz que e é do tipo serverexception, e por isso é possível acessar o valor de message
      return left(Failure(e.message));
    }
  }
}
