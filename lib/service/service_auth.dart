part of 'service.dart';

class AuthService {
  final fire_auth.FirebaseAuth _auth = fire_auth.FirebaseAuth.instance;
  
  bool _isSignIn = false;
  bool get isSignIn => _isSignIn;

  Future<void> init() async {
    final fire_auth.User authUser = await _auth.authStateChanges().first;
    _isSignIn = authUser != null;

    UserService _userService;
    
    if (_isSignIn) {
      final TypeUser type = await UserService.findType(authUser.uid);
      
      if (type == TypeUser.admin) {
        _userService = locator.get<UserService>(instanceName: 'Service Admin');
      } else if (type == TypeUser.pemantau) {
        _userService = locator.get<UserService>(instanceName: 'Service Pemantau');
      }

      final User user = await _userService.getUser(authUser.uid);
      locator.call<User>(instanceName: 'User Active').duplicate(user);
    }
  }

  Future<AuthResult> signUp(String name, String email, String password, TypeUser type) async {

    try {
      final fire_auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

      UserService _userService;
      if (type == TypeUser.admin) {
        _userService = UserService.admin();
      } else if (type == TypeUser.pemantau) {
        _userService = UserService.pemantau();
      }

      User user;
      if (type == TypeUser.admin) {
        await _userService.createUser(Admin(
          result.user.uid,
          name,
          email,
        ));  
      } else if (type == TypeUser.pemantau) {
        await _userService.createUser(Pemantau(
          result.user.uid,
          name,
          email,
        ));
      }

      return AuthResult(user: user);
    
    } on fire_auth.FirebaseAuthException catch (e) {
      
      String errorType = '';
      
      if (e.code == 'weak-password') {
        errorType = 'Password is too weak';
      }
      else if (e.code == 'email-already-in-use') {
        errorType = 'Email is already in use';
      }
      
      return AuthResult(message: errorType);
    
    } catch (e) {
      return AuthResult(message: 'Error signUp: $e');
    }
  }

  Future<AuthResult> signIn(String email, String password, TypeUser type) async {
    try {
      final fire_auth.UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

      UserService _userService;
      final TypeUser type = await UserService.findType(result.user.uid);
      if (type == TypeUser.admin) {
        _userService = UserService.admin();
      } else if (type == TypeUser.pemantau) {
        _userService = UserService.pemantau();
      }
      
      final User user = await _userService.getUser(result.user.uid);
      return AuthResult(user: user);

    } on fire_auth.FirebaseAuthException catch (e) {

      String errorType = 'Error Unknown';
      
      if (e.code == 'wrong-password') {
        errorType = 'Password is not correct';
      }
      else if (e.code == 'user-not-found') {
        errorType = 'Email is not found';
      }

      return AuthResult(message: errorType);
    } catch (e) {
      return AuthResult(message: 'Error signUp: $e');
    }
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

class AuthResult {
  final User user;
  final String message;

  AuthResult({this.user, this.message});
}