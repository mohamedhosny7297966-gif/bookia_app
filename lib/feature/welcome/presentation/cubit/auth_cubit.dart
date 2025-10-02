import 'package:bloc/bloc.dart';
import 'package:bookia/feature/auth/data/model/register_request_model.dart';
import 'package:bookia/feature/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());


  login ({required String email, required String password})async{
  emit(LoginLoadingState());
 final response= await AuthRepo.login(email: email, password: password);
 if(response is String){
   emit(LoginErrorState(response));
 }else{
   emit(LoginSuccessState());
 }
  }
  register (RegisterRequestModelModel registerModel)async{
    emit(RegisterLoadingState());
    final response = await AuthRepo.register(registerModel);
    if (response is String){
      emit(RegisterErrorState(response));
    }else{
      emit(RegisterSuccessState());
    }
  }
}
