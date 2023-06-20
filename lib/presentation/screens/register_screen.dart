import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register-cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              FlutterLogo(size: 100),
              RegisterForm(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = context.watch<RegisterCubit>().state.username;
    final password = context.watch<RegisterCubit>().state.password;
    final email = context.watch<RegisterCubit>().state.email;
    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          label: 'Nombre de Usuario',
          onChanged: registerCubit.usernameChange,
          errorMessage: username.errorMessage,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          label: 'Correo electrónico',
          onChanged: registerCubit.emailChange,
          errorMessage: email.errorMessage,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          onChanged: registerCubit.passwordChange,
          obscureText: true,
          label: 'Contraseña',
          errorMessage: password.errorMessage,
        ),
        FilledButton.tonalIcon(
          onPressed: () {
            registerCubit.onSubmit();
          },
          icon: const Icon(Icons.save),
          label: const Text('Crear usuario'),
        )
      ],
    ));
  }
}
