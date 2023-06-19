import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    print('Submit:$state');
  }

  void usernameChange(value) {
    emit(state.copyWith(username: value));
  }

  void emailChange(value) {
    emit(state.copyWith(email: value));
  }

  void passwordChange(value) {
    emit(state.copyWith(password: value));
  }
}
