import 'package:flutter/material.dart';
import 'package:myapp/auth/auth_service.dart';
import 'package:myapp/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async{
    final email=_emailController.text;
    final password=_passwordController.text;

    if(email.isEmpty || password.isEmpty){
      return;
    }
    try{
      authService.singInWithEmailPassword(email, password);
    }
    catch(e){
      if(mounted){
        ScaffoldMessenger.of(context).
          showSnackBar(SnackBar(content: Text("Error: $e")));

      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"),),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 50),
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: "Email"),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: login,
            child: const Text("Login"),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () =>Navigator.push(context,MaterialPageRoute(builder: (context)=> const RegisterPage()) ),
            child: const Center(child: Text("Don't have an account?Sign Up")))
        ],
      ),
    );
  }
}
