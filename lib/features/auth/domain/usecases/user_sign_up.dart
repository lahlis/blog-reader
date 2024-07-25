import 'package:blog/core/error/failures.dart';
import 'package:blog/core/usecase/usecase.dart';
import 'package:blog/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<String, UserSignUpParams> {
  final AuthRepository
      authRepository; //utiliza da camada de dominio, pois não se deseja depender da implementação (data layer) e sim da interface (domain)
  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    //como o retorno é um future, precisa de async aqui
    //função do tipo future -> await. importante usar porque pode ser que retorne ou não.
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

//como não se pode passar mais de um parametro dentro do <> do usecase, se cria uma classe com a lista de parâmetros que se deseja.
class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
