import 'package:injectable/injectable.dart';
import 'package:task_1/core/service/service.dart';
import 'package:task_1/data/model/clinic_model.dart';
import 'package:task_1/data/source/json_data.dart';

abstract class GetClinicRepo {
  Future<Clinics> getAllClinics();
  Future<void> changePrice(double price);
}
@Named("local")
@Injectable(as: GetClinicRepo )
 class GetClinicRepoImpl extends GetClinicRepo {
  AsyncService asyncService ;
  JsonDataSrc src ;

  GetClinicRepoImpl(this.asyncService,this.src);

  @override
  Future<Clinics> getAllClinics() async{
    print(asyncService.toString());
    return await src.readJson();
  }

  @override
  Future<void> changePrice(double price) async{
    await src.changePrice(price);
  }
}

@Named("remote")
@Injectable(as: GetClinicRepo )
 class NetworkClinicRepoImpl extends GetClinicRepo {
  JsonDataSrc src ;
   NetworkClinicRepoImpl(this.src);

  @override
  Future<Clinics> getAllClinics() async{
    print("remote");
    return await src.readJson();
  }

  @override
  Future<void> changePrice(double price) async{
    await src.changePrice(price);
  }
}