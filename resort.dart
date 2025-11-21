class Resort {
  String? name;
  int? roomsAvailable;
  double? price;

  Resort(this.name, this.roomsAvailable, this.price);

  bool bookRoom(int rooms) {
    if (rooms <= roomsAvailable!) {
      roomsAvailable = roomsAvailable! - rooms;
      return true;
    } else {
      return false;
    }
  }

  void display() {
    print("Resort : ${name!}");
    print("Rooms Available : ${roomsAvailable!}");
    print("Price : ${price!}");
  }
}

void main() {
  Resort res = Resort("emerald", 10, 10000.0);
  res.display();

  int roomsToBook = 3;

  print("\nTrying to book $roomsToBook rooms...");

  bool success = res.bookRoom(roomsToBook);
  if (success) {
    print("Booking successful! Remaining rooms: ${res.roomsAvailable}");
  } else {
    print("Booking failed. Not enough rooms.");
  }
}
