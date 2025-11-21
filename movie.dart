class MovieTicket{
  String?movieName;
  int?totalSeat;
  double?ticketPrice;
  
  MovieTicket(this.movieName,this.totalSeat,this.ticketPrice);
  
  
  bool bookTickets(int n){
    if(n <=totalSeat!){
      totalSeat=totalSeat!-n;
      return true;
      
    }else{
      return false;
    }
    
  }
  void displayInfo(){
    print("Movie name :${movieName!}");
    print("TotalSeat :${totalSeat!}");
    print("Ticket price:${ticketPrice!}");
  }
}
void main(){
  MovieTicket mov=MovieTicket("deisire",150,250.0);
  mov.displayInfo();
  
  int ticket=2;
  
      print("\n Trying to Book! $ticket ticktess...");
  
  bool sucess= mov.bookTickets(ticket);

  if(sucess){
    print("\n Booking sucessfull ! Reaming setas:${mov.totalSeat}");
    
  }else{
    print("\n  Booking failed .not enough seats.");
    
    
  }
  
}