import 'package:flutter/material.dart';
import 'package:news/ui/list_news_screen.dart';
import 'package:news/ui/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            keyboardType: TextInputType.emailAddress,
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListNewsScreen(),
                ),
              );
            },
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          InkWell(
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
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
