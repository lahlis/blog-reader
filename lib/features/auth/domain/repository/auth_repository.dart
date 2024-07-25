import 'package:blog/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> loginWithEmailPassword({
    
    required String email,
    required String password,
  });
}

/* Notas

Diferenças entre abstract class e interface class:
- abstract class: fornece uma base de classe para subclasses concretas para que possam herdar
- abstract interface: define uma série de métodos que uma classe deve implementar

fpdart: 
Fornece a classe Either, que proporciona uma forma de especificar o retorno e assim de lidar tanto com erros (esquerda) como sucesso (direita)

Future: o processo de conectar com o supabase e pegar dados é assíncrono
 */