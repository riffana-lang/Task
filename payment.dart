abstract class Payment{
  double amount;
  
  
  Payment(this.amount);
  void processpayment();
  
  
  
}
class CreditCardPayment extends Payment{
  CreditCardPayment(double amount):super(amount);
  
  @override
  void processpayment(){
    print("process credit card paymnet :$amount");
    
  }
  
  
  
}
class UPIPayment extends Payment{
  UPIPayment(double amount):super(amount);
  
  @override
  void processpayment(){
    print("process UPI payment :$amount");
    
  }
}
void main(){
  Payment  card=CreditCardPayment(5000);
  Payment upi=UPIPayment(1200);
  card.processpayment();
  upi.processpayment();
  
}