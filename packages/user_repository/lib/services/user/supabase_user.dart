import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:user_repository/repository/user_repository.dart';

class SupabaseUser extends UserRepository {
  @override
  Future<void> init(String baseUrl, String apiKey) async {
    await Supabase.initialize(
      url: baseUrl,
      anonKey: apiKey,
    );
  }
}
