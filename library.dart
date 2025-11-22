class Book {
  int _bookId;
  String _title;
  String _author;
  int _copies;

  Book(this._bookId, this._title, this._author,this._copies);
  
  
  int get bookid=>_bookId;
  String get title=>_title;
  String get author=>_author;
  int get copies=>_copies;
  
  
}

class Library {
  String name;
  List<Book> books = [];

  Library(this.name) {
   
    print("Library created: ${name}");
  }

  void addBook(Book book) {
    books.add(book);
    print("Book Added: ${book._bookId} - ${book._title}");
  }

  void showBooks() {
    print("\n--- $name Books ---");
    if (books.isEmpty) {
      print("No books in this library.");
      return;
    }
    for (var bo in books) {
      print("${bo._bookId} | ${bo._title} | by ${bo._author} | Copies: ${bo._copies}");
    }
  }

  void borrowBook(String title) {
    for (var b in books) { 
      if (b._title == title && b._copies > 0) {
        b._copies--;
        print("Borrowed: $title");
        print("Remaining Copies: ${b._copies}\n");
        return;
      }
    }
    print("Book Not Available: $title");
  }
}

class PublicLibrary extends Library {
  bool membershipRequired = true;

  PublicLibrary(String name) : super(name);


  @override
  void showBooks() {
    super.showBooks();
    print("(Membership Required)");
  }
}

class SchoolLibrary extends Library {
  int gradeLevel;

  SchoolLibrary(String name, this.gradeLevel) : super(name);

  @override
  void addBook(Book book) {
    if (book._copies >= 10) {
      books.add(book);
      print("Book Added: ${book._bookId} - ${book._title} (Allowed)");
    } else {
      print("Book Added: ${book._bookId} - ${book._title} (Denied: Less copies)");
    }
  }

  @override
  void showBooks() {
    super.showBooks();
    print("(Grade Level: $gradeLevel)");
  }
}

void main() {
  
  var publicLib = PublicLibrary("City Public Library");

  publicLib.addBook(Book(101, "Harry Potter","jk rowling",5));
  publicLib.addBook(Book(102, "Percy Jackson","Rick Riordan", 6));

  publicLib.borrowBook("Harry Potter");

  var schoolLib = SchoolLibrary("Sunrise School Library", 8);

  schoolLib.addBook(Book(201, "Mathematics","RD Sharma", 20));
  schoolLib.addBook(Book(202, "English Grammar","Martin", 5)); 

  publicLib.showBooks();
  schoolLib.showBooks();
}