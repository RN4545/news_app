import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/blocs/auth_bloc.dart';
import 'package:news/blocs/auth_event.dart';
import 'package:news/blocs/auth_state.dart';
import 'package:news/ui/signup_screen.dart';

import 'list_news_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is AuthSuccess) {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ListNewsScreen(),
              ),
            );


          } else if (state is AuthFailure) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("❌ ${state.error}"),
              ),
            );
          }
        },
        child: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Image(
                image: AssetImage('assets/images/new_login_vector.png'),
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Log in ✨",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "Welcome back! Please enter your details.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 14.0,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "abc@gmail.com",
                labelText: "Enter Your Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: passController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "Abc@123",
                labelText: "Enter Your Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 44.0)),
              onPressed: () {
                final email = emailController.text.trim();
                final pass = passController.text.trim();
                if (email.isNotEmpty && pass.isNotEmpty) {
                  context.read<AuthBloc>().add(
                        LoginRequested(email, pass),
                      );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please entered correct details'),
                    ),
                  );
                }
              },
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                            fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
