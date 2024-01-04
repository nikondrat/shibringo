import 'package:user_repository/models/models.dart';

abstract class UserRepository {
  Future<void> init(String baseUrl, String apiKey);

  Future<bool> isLogged();

  Future<UserModel?> getUserData();

  Future changeAvatar(
      {required Function(String imageUrl) onDone,
      required Function(ConnectionStateException exception) onError});

  Future updateUserData(Map<String, dynamic> data,
      {String? avatarUrl,
      required Function() onDone,
      required Function(ConnectionStateException exception) onError});
}
