import 'package:flutter/material.dart';

class Homescrn extends StatelessWidget {
  
  final String Username;
  Homescrn({super.key, required this.Username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          title: const Center(
            child: Text(
              "Home",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.deepPurpleAccent[100]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Welcome,$Username!",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
