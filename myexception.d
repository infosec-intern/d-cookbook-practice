// Exceptions are recoverable
// Errors are NOT recoverable
class MyException : Exception {
  // declare a constructor
  // __FILE__ and __LINE__ are determined when the exception is called
  // 'Throwable next' is useful if an exception handler throws an exception
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
  // dmd -g <filename> @ compile time will include debug symbols
  catch(MyException e)
    writeln("caught ", e);
}
