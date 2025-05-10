import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  //Sign in with email and password
  Future<AuthResponse> singInWithEmailPassword(
    String email,
    String password,
  ) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  //SignUp with email and password
  Future<AuthResponse> signUpWithEmailPassword(
    String email,
    String password,
  ) async {
    return await _supabase.auth.signUp(email: email, password: password);
  }

  //SignOut
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  //Get User Email
  String? getCurrentUserEmail() {
    final _session = _supabase.auth.currentSession;
    final _user=_session?.user;
    return _user?.email;
  }
}
