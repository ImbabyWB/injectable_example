import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:task_1/domain/auth_usecase.dart';
@Injectable(scope: "Auth")
class AuthBloc extends Cubit<AuthState>{
  AuthUseCase useCase;
  AuthBloc(this.useCase) : super(AuthState.loading);

  login(String username , String pass)async{
    await useCase.login(username, pass);
    print("done");
    emit(AuthState.loggedIn);
  }

}
enum AuthState {
  loading , loggedIn
}