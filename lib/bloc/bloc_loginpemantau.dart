part of 'bloc.dart';

class LogInPemantauBloc implements Bloc {

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
      name, password, TypeUser.pemantau).whenComplete(() {
        _loadingController.sink.add(false);
      });
      createPemantau(result);

    if (result.user != null) {
      return 'User Active';
    }
    else {
      return result.message;
    }
  }

  void createPemantau(AuthResult result) {
    if (!locator.isRegistered<Pemantau>(instanceName: 'Pemantau Active')) {
      locator.registerSingleton(Pemantau.initial(), instanceName: 'Pemantau Active');
      locator.call<Pemantau>(instanceName: 'Pemantau Active').duplicate(result.user);
    } else {
      locator.unregister<Pemantau>(instanceName: 'Pemantau Active');
    }
  }
}
