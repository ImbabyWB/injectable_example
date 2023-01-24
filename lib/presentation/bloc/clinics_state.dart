import 'package:task_1/data/model/clinic_model.dart';

class ClinicsState {
  Clinics? clinics ;
  ActionStates states ;
  ClinicsState(this.states ,{this.clinics });
}
enum ActionStates {
  idle ,loading , success , error
}