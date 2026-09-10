import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Movie Ticket Booking"),
        ),
        body: Column(
          children: [
            const Text("Now Showing"),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("Kalki"),
                Text("RRR"),
                Text("Pushpa"),
              ],
            ),

            const SizedBox(height: 30),

            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 100,
                  width: 200,
                  color: Colors.blue,
                ),
                const Text(
                  "Book Ticket",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}