import 'package:blog/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//criado como interface, faz com que mesmo que se utilize outro data source que não seja o supabase, sejam utilizadas essas funções
abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  //dependency injection: sempre que a classe authremoteimpl é chamada, a instancia supabaseCliente será injetada
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      //abaixo, cria o user e faz com que registrado no supabase
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {
        //como não tem a propriedade name no .signUp, utiliza o data pra passar qualquer coisa
        'name': name, //key é a string name e o value o nome do usuário
      });
      //depois, pega a resposta dessa criação checando se é null
      if (response.user == null) {
        throw const ServerException('User is null!');
      }
      return response.user!
          .id; //se nao for null, retorna um id que é gerado automaticamente pelo supabase
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

/* observação:
nessa interface, se utiliza apenas String no Future (ao contrário da interface na camada de dominio, que usa o Either).
isso ocorre porque no "remote data source" nós apenas nos preocupamos com as chamadas feitas para o database externo.
não se deseja nenhuma dependência ou plugins dentro dele.
 */