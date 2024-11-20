import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_cubit/Cubit.dart';
import 'package:login_cubit/Homescrn.dart';


class Loginscrn extends StatefulWidget {
  @override
  State<Loginscrn> createState() => _LoginscrnState();
}

class _LoginscrnState extends State<Loginscrn> {
  
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.isLoggedIn) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homescrn(Username: usernameController.text.trim(),)),
            );
          }
           else if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.error}')),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 200),
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(color: Colors.grey[1000], fontSize: 16),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [

                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.grey[800]),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade500),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "Enter your Username",
                          hintStyle: TextStyle(color: Colors.grey[500]),
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextField(
                        controller: passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.grey[800]),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            color: Colors.black,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade500),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "Enter your Password",
                          hintStyle: TextStyle(color: Colors.grey[500]),
                        ),
                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password?', style: TextStyle(color: Colors.grey[800])),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                state.isLoading
                    ? CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () {
                          final username = usernameController.text.trim();
                          final password = passwordController.text.trim();
                          context.read<LoginCubit>().login(username, password);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.symmetric(horizontal: 27),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
               
              ],
            ),
          );
        },
      ),
    );
  }
}
