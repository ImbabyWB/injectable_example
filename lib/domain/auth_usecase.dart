import 'package:injectable/injectable.dart';
import 'package:task_1/core/auth_provider.dart';

abstract class AuthUseCase {
  Future<bool> login(String username ,String password);
}
@Injectable(as: AuthUseCase)
 class AuthUseCaseImpl extends AuthUseCase {
  AuthProvider authRepo ;

  AuthUseCaseImpl(this.authRepo);

  @override
  Future<bool>  login(String username, String password) async{
    return await authRepo.login(username, password);
  }
}
