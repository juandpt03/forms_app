part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final String username;
  final String email;
  final String password;

  const RegisterFormState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.formStatus = FormStatus.invalid,
  });
  @override
  List<Object> get props => [formStatus, username, email, password];
  RegisterFormState copyWith({
    FormStatus? formStatus,
    String? username,
    String? email,
    String? password,
  }) =>
      RegisterFormState(
        formStatus: formStatus ?? this.formStatus,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
      );
}