void main() {
  String movie = "Kalki";
  int ticketPrice = 200;
  int tickets = 3;

  double calculateTotal(int price, int count) {
    return (price * count).toDouble();
  }

  if (tickets > 0) {
    print("Movie: $movie");
    print("Ticket Price: Rs. $ticketPrice");
    print("Number of Tickets: $tickets");
    print("Total Price: Rs. ${calculateTotal(ticketPrice, tickets)}");
  } else {
    print("Please select at least one ticket");
  }
}