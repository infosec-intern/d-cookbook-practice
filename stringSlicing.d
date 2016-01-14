import std.stdio;
import std.string;

void main() {
  string s = "月明かり is some Japanese text.";
  writeln("START: ", s);
  string japaneseText = s[0 .. s.indexOf(" ")];
  foreach(index, char c; japaneseText)
    writefln("UTF-8 Code unit at index %d is %d", index, c);
  foreach(dchar c; japaneseText)
    writefln("UTF-32 Code unit at index %d is %c", c, c);
  writeln("END: ", japaneseText);
}
