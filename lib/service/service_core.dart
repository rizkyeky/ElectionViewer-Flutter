part of 'service.dart';

class CoreService {
  Future<void> init() async {
    await fire_core.Firebase.initializeApp();
  }
}