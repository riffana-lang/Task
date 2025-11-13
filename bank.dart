class Account {
  int _accountNumber;
  String _holderName;
  double _balance;

  Account(this._accountNumber, this._holderName, this._balance);

  int get accountNumber => _accountNumber;
  String get holderName => _holderName;
  double get balance => _balance;

  void deposit(double amount) {
    _balance += amount;
    print("Deposited $amount");
  }

  void withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
      print("Withdrawal of $amount successful");
    } else {
      print("Insufficient balance");
    }
  }

  void showDetails() {
    print("Account: $_accountNumber | Name: $_holderName | Balance: $_balance");
  }
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountnumber, String holdername, double balance, this.interestRate)
      : super(accountnumber, holdername, balance);

  void addInterest() {
    double interest = balance * interestRate / 100;
    deposit(interest);
    print("Interest added: $interest");
  }
}

class CurrentAccount extends Account {
  double transactionLimit;

  CurrentAccount(int accountnumber, String holdername, double balance, this.transactionLimit): super(accountnumber, holdername, balance);


  @override
  void withdraw(double amount) {
    if (amount > transactionLimit) {
      print("Transaction denied! Limit $transactionLimit");
    } else {
      super.withdraw(amount);
    }
  }
}

void main() {
  
  SavingsAccount save = SavingsAccount(1001, "Ramesh", 0, 5.0);
  
  print("Savings Account Created: ${save.accountNumber} - ${save.holderName}");
  
  save.deposit(5000);
  save.addInterest();
  print("Balance: ${save.balance}");

  
  CurrentAccount cur = CurrentAccount(1002, "Adil", 0, 10000);
  print("Current Account Created: ${cur.accountNumber} - ${cur.holderName}");
  
  cur.deposit(10000);
  cur.withdraw(7000);
  print("Balance: ${cur.balance}");

  print("--- All Account Details ---");
  save.showDetails();
  cur.showDetails();
}
