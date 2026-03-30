import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> checkAuthStatus();
  Future<UserEntity> loginWithEmail(String email, String password);
  Future<UserEntity> registerWithEmail(String email, String password);
  Future<UserEntity> loginWithGoogle();
  Future<void> logout();
}
