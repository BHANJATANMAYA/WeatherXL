import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterWithEmailUseCase {
  final AuthRepository repository;

  RegisterWithEmailUseCase(this.repository);

  Future<UserEntity> call(String email, String password) {
    return repository.registerWithEmail(email, password);
  }
}
