part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final bool isValid;
  final FormStatus formStatus;
  final Username username;
  final Email email;
  final Password password;

  const RegisterFormState({
    this.isValid = false,
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.formStatus = FormStatus.invalid,
  });
  RegisterFormState copyWith({
    bool? isValid,
    FormStatus? formStatus,
    Username? username,
    Email? email,
    Password? password,
  }) =>
      RegisterFormState(
        formStatus: formStatus ?? this.formStatus,
        username: username ?? this.username,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
        password: password ?? this.password,
      );
  @override
  List<Object> get props => [formStatus, username, email, password, isValid];
}
