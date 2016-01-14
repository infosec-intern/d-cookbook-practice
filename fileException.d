import core.sys.posix.unistd; 	// for the low-level Posix functions
import core.sys.posix.fnctl; 	// for more low-level Posix functions
import std.exception; 		// for ErrnoException
auto fd = open("myfile.txt", O_RDONLY);
// open() returns -1 if it was unable to open the file,
// and sets errno with error details. Check for that failure.
if(fd == -1)
    throw new ErrnoException("Couldn't open myfile.txt");
// close the file automatically at the end of the scope
scope(exit) close(fd);
/* read the file here */
