part of 'bloc.dart';

class LogInAdminBloc implements Bloc {

  final AuthService _authService = locator.get<AuthService>(instanceName: 'Service Auth');

  final BehaviorSubject<bool> _loadingController = BehaviorSubject();
  Stream<bool> get isLoadingStream => _loadingController.stream;

  @override
  void dispose() {
    _loadingController.close();
  }

  @override
  void init() {}

  Future<String> logIn(String name, String password) async {
    _loadingController.sink.add(true);
    final AuthResult result = await _authService.signIn(
      name, password, TypeUser.admin).whenComplete(() => _loadingController.sink.add(false));

    if (result.user != null) {
      return 'User Active';
    }
    else {
      return result.message;
    }
  }
}
