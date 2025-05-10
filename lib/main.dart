import 'package:flutter/material.dart';
import 'package:myapp/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13ZXRyZHF2Y2Z1ZWRyanBqYXBiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQwOTQ2MjIsImV4cCI6MjA1OTY3MDYyMn0.NcwMWiHdPZzj3aHNvlFg9RS1CxQNBZ16nhELG1NWMcc",
    url: "https://mwetrdqvcfuedrjpjapb.supabase.co",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthGate());
  }
}
