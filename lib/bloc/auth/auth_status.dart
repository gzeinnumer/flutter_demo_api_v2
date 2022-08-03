abstract class AuthStatus{
  const AuthStatus();
}

class AuthInit extends AuthStatus{
  const AuthInit();
}

class AuthShowLoading extends AuthStatus{}

class AuthOnSuccess extends AuthStatus{
  final List<String> list;

  AuthOnSuccess(this.list);
}

class AuthOnFailed extends AuthStatus{
  final Exception exception;

  AuthOnFailed(this.exception);
}

