import 'package:flutter/material.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Movie Ticket Booking"),
        ),
        body: Column(
          children: [
            Text("Now Showing"),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Kalki"),
                Text("RRR"),
                Text("Pushpa"),
              ],
            ),

            SizedBox(height: 30),

            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 100,
                  width: 200,
                  color: Colors.blue,
                ),
                Text(
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