import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monety/data/local/repository/user_repo.dart';
import 'package:monety/ui/signup/bloc/user_event.dart';
import 'package:monety/ui/signup/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvents,UserState>{
  UserRepository userRepo;
    UserBloc({required this.userRepo}):super(UserInitialState()){
      on<RegisterEvent>((event,emit){
        emit(UserLoadingState());

        int result =userRepo.UserRegister(newUser: event.mUser);

        if(result == 1){
          emit(UserSuccessState());
        }
        else if(result == 2){
          emit(UserErrorState(error: "User Email Already Exists"));
        }
        else if(result == 3){
          emit(UserErrorState(error: "User Mobile No Already Exists"));
        }
        else{
          emit(UserErrorState(error: "Query Problem"));
        }
      });
      on<AuthenticateEvent>((event,emit){
        emit(UserLoadingState());

        int result =userRepo.authenticateUserRepo(email: event.email, pass: event.password);

        if(result==1){
          emit(UserSuccessState());
        }
        else{
          emit(UserErrorState(error: "User not Found"));
        }
      });
  }
}