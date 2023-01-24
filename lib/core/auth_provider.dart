import 'package:injectable/injectable.dart';

@Singleton()
class AuthProvider {
  Future<bool> login(String username , String password)async{
    return await Future.value(true);
  }
  @disposeMethod
  void dispose (){

  }
}