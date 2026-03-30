import 'package:weatherxl/features/auth/domain/entities/user_entity.dart';
import 'package:weatherxl/features/auth/domain/repositories/auth_repository.dart';

import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<UserEntity> _authenticate(
    Future<UserEntity> Function() authAction,
  ) async {
    try {
      final user = await authAction();
      await localDataSource.saveLoginState(true, user.id);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserEntity?> checkAuthStatus() async {
    try {
      final bool isLoggedIn = localDataSource.isLoggedIn();
      if (isLoggedIn) {
        final user = await remoteDataSource.getCurrentUser();
        return user;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<UserEntity> loginWithEmail(String email, String password) async {
    return _authenticate(
      () => remoteDataSource.loginWithEmail(email, password),
    );
  }

  @override
  Future<UserEntity> loginWithGoogle() async {
    return _authenticate(() => remoteDataSource.loginWithGoogle());
  }

  @override
  Future<void> logout() async {
    await remoteDataSource.logout();
    await localDataSource.clearLoginState();
  }

  @override
  Future<UserEntity> registerWithEmail(String email, String password) async {
    return _authenticate(
      () => remoteDataSource.registerWithEmail(email, password),
    );
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await remoteDataSource.sendPasswordResetEmail(email);
  }
}
