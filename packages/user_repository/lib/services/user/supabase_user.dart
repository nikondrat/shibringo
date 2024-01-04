import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:user_repository/models/models.dart';
import 'package:user_repository/repository/user_repository.dart';
import 'package:user_repository/services/services.dart';

class SupabaseUser extends UserRepository {
  @override
  Future<void> init(String baseUrl, String apiKey) async {
    await Supabase.initialize(
      url: baseUrl,
      anonKey: apiKey,
    );
  }

  @override
  Future<bool> isLogged() async {
    return Supabase.instance.client.auth.currentSession != null;
  }

  @override
  Future changeAvatar(
      {required Function(String imageUrl) onDone,
      required Function(ConnectionStateException exception) onError}) async {
    await PickerService().pickAvatar(
        onDone: (data, path, file) async {
          try {
            await Supabase.instance.client.storage.from('avatars').uploadBinary(
                path, data,
                fileOptions: FileOptions(contentType: file.mimeType));
            final imageUrlResponse = await Supabase.instance.client.storage
                .from('avatars')
                .createSignedUrl(path, 60 * 60 * 24 * 365 * 10);

            onDone(imageUrlResponse);
          } on StorageException catch (_) {
            onError(ConnectionStateException.tryLater);
          } catch (e) {
            onError(ConnectionStateException.unknown);
          }
        },
        onError: (exception) => switch (exception) {
              PickerStateException.unknown =>
                onError(ConnectionStateException.unknown),
              PickerStateException.storageError =>
                onError(ConnectionStateException.tryLater)
            });
  }

  @override
  Future updateUserData(Map<String, dynamic> data,
      {String? avatarUrl,
      required Function() onDone,
      required Function(ConnectionStateException exception) onError}) async {
    try {
      final userId = Supabase.instance.client.auth.currentSession?.user.id;

      final Map map = {
        'id': userId,
      };

      map.addAll(data);

      if (avatarUrl != null) map['avatar_url'] = avatarUrl;

      await Supabase.instance.client.from('profiles').upsert(map);
      onDone();
    } on PostgrestException catch (_) {
      return onError(ConnectionStateException.tryLater);
    } catch (_) {
      return onError(ConnectionStateException.unknown);
    }
  }

  @override
  Future<UserModel?> getUserData() async {
    try {
      final User? user = Supabase.instance.client.auth.currentSession?.user;
      if (user != null) {
        final data = await Supabase.instance.client
            .from('profiles')
            .select()
            .eq('id', user.id)
            .single();

        return UserModel(
            id: user.id,
            email: user.email!,
            nickname: data['nickname'],
            avatarUrl: data['avatar_url']);
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
