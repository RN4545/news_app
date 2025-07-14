import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: Text("Login Page"),),
      body: _body(),
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
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
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
              onPressed: () {},
              child: const Text(
                "Sing Up",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ))
        ],
      ),
    );
  }
}
