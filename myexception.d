class MyException : Exception {
  // declare a constructor
  this(string message, string file = __FILE__, size_t line = __LINE__, Throwable next = null) {
    // parent class's constructor - Exception in this case
    super(message, file, line, next);
  }
}

void main() {
  import std.stdio;
  try
    throw new MyException("Message Here!");
  // prints a stacktrace too
  catch(MyException e)
    writeln("caught ", e);
}
