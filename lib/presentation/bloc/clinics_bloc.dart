import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:task_1/data/model/clinic_model.dart';
import 'package:task_1/domain/get_clinic_usecase.dart';
import 'package:task_1/presentation/bloc/clinics_state.dart';
@Injectable(scope: "HomeScope")
class ClinicsBloc extends Cubit<ClinicsState>{
  GetClinicUseCase clinicUseCase ;
ClinicsBloc(this.clinicUseCase):super(ClinicsState(ActionStates.idle));
    getAllClinics ()async{
      emit(ClinicsState(ActionStates.loading));
      try
      {
       Clinics clinics = await clinicUseCase.getAllClinics();
       emit(ClinicsState(ActionStates.success, clinics: clinics));
      }       catch(e){
        emit(ClinicsState(ActionStates.error));
      }
      }
      changePrice (double price)async{
      emit(ClinicsState(ActionStates.loading));
      try
      {
        await clinicUseCase.changePrice(price);
       emit(ClinicsState(ActionStates.success,));
      }       catch(e){
        emit(ClinicsState(ActionStates.error));
      }
      }

  }