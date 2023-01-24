import 'package:injectable/injectable.dart';
import 'package:task_1/data/get_clinic_repo.dart';
import 'package:task_1/data/model/clinic_model.dart';
abstract class GetClinicUseCase {
 Future<Clinics> getAllClinics();
 Future<void> changePrice(double price);
}

@Injectable(as: GetClinicUseCase,)
class GetClinicUseCaseImpl extends GetClinicUseCase{
  GetClinicRepo getClinicRepo ;

  GetClinicUseCaseImpl(@Named("local") this.getClinicRepo);

  @override
  Future<Clinics> getAllClinics() async{
    return await getClinicRepo.getAllClinics();
  }

  @override
  Future<void> changePrice(double price) async{
    await getClinicRepo.changePrice(price);
  }

}