import 'package:injectable/injectable.dart';

@LazySingleton()
class AsyncService {
  AsyncService(Service service);
  @FactoryMethod(preResolve:true)
  static Future<AsyncService> createWith() async =>await Future.value(AsyncService(Service.fromText()));
  @disposeMethod
  void dispose (){
    print("disposing");
  }
}
@Injectable()
class Service {
  String source ;

  @preResolve
  factory Service.fromText(){
    return Service("Text");
  }


  Service(this.source);
}