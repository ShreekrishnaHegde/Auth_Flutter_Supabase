/*
Auth gate will continuously listen for auth state changes.
*/

import 'package:flutter/material.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //Listen to Auth State Changes
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        //Loading..
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        final session = snapshot.hasData ? snapshot.data!.session : null;
        //Check if there is valid session
        if (session != null) {
          return ProfilePage();
        } else {
          return LoginPage(); 
        }
      },
    );
  }
}
