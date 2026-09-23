import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BookingProvider(),
      child: const MyApp(),
    ),
  );
}

// Provider manages the selected movie and its price.
class BookingProvider extends ChangeNotifier {
  String selectedMovie = "Kalki";

  final Map<String, int> prices = {
    "Kalki": 200,
    "RRR": 180,
    "Pushpa": 150,
  };

  void selectMovie(String movie) {
    selectedMovie = movie;
    notifyListeners();
  }

  int get price => prices[selectedMovie] ?? 0;
}

// Main application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Named routes
      routes: {
        '/booking': (context) => const BookingScreen(),
      },

      home: const HomeScreen(),
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = Provider.of<BookingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Ticket Booking"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Now Showing",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            // Movie selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    booking.selectMovie("Kalki");
                  },
                  child: const Text("Kalki"),
                ),
                ElevatedButton(
                  onPressed: () {
                    booking.selectMovie("RRR");
                  },
                  child: const Text("RRR"),
                ),
                ElevatedButton(
                  onPressed: () {
                    booking.selectMovie("Pushpa");
                  },
                  child: const Text("Pushpa"),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              "Selected Movie: ${booking.selectedMovie}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              "Ticket Price: ₹${booking.price}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30),

            // Navigator.push()
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MovieDetailsScreen(),
                    ),
                  );
                },
                child: const Text("View Movie Details"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Movie Details Screen
class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = Provider.of<BookingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              booking.selectedMovie,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              "Ticket Price: ₹${booking.price}",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 30),

            // Navigator.pushNamed()
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/booking');
              },
              child: const Text("Book Ticket"),
            ),

            const SizedBox(height: 15),

            // Navigator.pop()
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}

// Booking Screen
class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int ticketCount = 1;

  @override
  Widget build(BuildContext context) {
    final booking = Provider.of<BookingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Ticket"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Movie: ${booking.selectedMovie}",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 15),

            Text(
              "Price per ticket: ₹${booking.price}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (ticketCount > 1) {
                      setState(() {
                        ticketCount--;
                      });
                    }
                  },
                  icon: const Icon(Icons.remove),
                ),

                Text(
                  "$ticketCount",
                  style: const TextStyle(fontSize: 20),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      ticketCount++;
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              "Total: ₹${booking.price * ticketCount}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Booked $ticketCount ticket(s) for ${booking.selectedMovie}",
                    ),
                  ),
                );
              },
              child: const Text("Confirm Booking"),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}