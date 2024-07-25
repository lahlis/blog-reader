import 'package:blog/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

/* notas:
essa interface padroniza os usecases.

todo usecase só deverá ter apenas 1 função (pois cada usecase só deverá fazer uma tarefa).

sempre que se for implementar o usecase, será necessário passar:
- successtype: esse parametro alimentará a função e será o tipo de sucesso esperado dentro do either.
- params: cada usecase terá diferentes conjuntos parametros. assim, cada caso, será pedido os parametros especificos para alimentar a função

call(): função única
  
 */