import 'package:flutter_demo_api_v2/bloc/auth/auth_status.dart';

class AuthState {
  final String password;
  bool get isValidPassword => password.length > 6;
  final AuthStatus authStatus;
  final List<String> list;

  final bool isShow;

  AuthState(
      {this.password = "",
      this.authStatus = const AuthInit(),
      this.isShow = false,
      this.list = const []});

  AuthState copyWith({
    String? password,
    AuthStatus? authStatus,
    bool? isShow,
  }) {
    return AuthState(
        password: password ?? this.password,
        authStatus: authStatus ?? this.authStatus,
        isShow: isShow ?? this.isShow);
  }
}
