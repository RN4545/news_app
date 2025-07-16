import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/blocs/auth_bloc.dart';
import 'package:news/blocs/auth_event.dart';
import 'package:news/blocs/auth_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Signup Successfully"),
              ),
            );
            Navigator.pop(context);
          } else if (state is AuthFailure) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("❌ ${state.error}")),
            );
          }
          // TODO: implement listener
        },
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
                  "Create an account ✨",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  "Welcome! Please enter your details.",
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
            controller: nameController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "eg.Roshan Arun Nakate",
              labelText: "Name",
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
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "abc@gmail.com",
              labelText: "Enter Your email",
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
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: "Abc@123",
              labelText: "Enter Your password",
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
                        SignupRequested(email, pass),
                      );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Fill all fields!")),
                  );
                }
              },
              child: const Text(
                "Sing Up",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ))
        ],
      ),
    );
  }
}
