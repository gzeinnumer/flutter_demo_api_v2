import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_api_v2/bloc/auth/auth_event.dart';
import 'package:flutter_demo_api_v2/bloc/auth/auth_state.dart';
import 'package:flutter_demo_api_v2/bloc/auth/auth_status.dart';

import '../base/atribut/space_10.dart';
import '../bloc/auth/auth_bloc.dart';
import '../repo/auth_repo.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(context.read<AuthRepo>()),
        )
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            ),
            const Space10(),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            const Space10(),
            _passwordField(),
            _login(),
            _res()
          ],
        ),
      ),
    ));
  }

  Widget _res() {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        final authStatus = state.authStatus;
        if (authStatus is AuthOnSuccess) {
          // authStatus.list

        }
      },
      child: Text('res'),
      //pakai bloc bluilder
    );
  }

  Widget _login() =>
      BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return state.authStatus is AuthShowLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  context
                      .read<AuthBloc>()
                      .add(AuthSubmitted(state.password, state.password));
                },
                child: const Text('Login'),
              );
      });

  Widget _passwordField() {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return TextFormField(
        validator: (value) =>
            state.isValidPassword ? null : 'Password is too short',
        onChanged: (value) =>
            context.read<AuthBloc>().add(AuthPasswordChanged(value)),
        controller: _passwordController,
        obscureText: state.isShow,
        decoration: InputDecoration(
          labelText: "Password",
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: state.isShow
                ? const Icon(Icons.password_sharp)
                : const Icon(Icons.percent),
            onPressed: () {
              context.read<AuthBloc>().add(AuthVisiblePassword(!state.isShow));
            },
          ),
        ),
      );
    });
  }
}
