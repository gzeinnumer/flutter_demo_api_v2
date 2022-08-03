abstract class AuthEvent{
  const AuthEvent();
}

class AuthVisiblePassword extends AuthEvent{
  final bool isShow;

  AuthVisiblePassword(this.isShow);
}

class AuthPasswordChanged extends AuthEvent{
  final String text ;

  AuthPasswordChanged(this.text);
}

class AuthSubmitted extends AuthEvent{
  final String username;
  final String password;

  AuthSubmitted(this.username, this.password);
}