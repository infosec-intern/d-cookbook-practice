import std.stdio : writeln;;;

void main() {
  writeln("Core Tasks!");
//  arrays();
  assoc_arrays();
}

void assoc_arrays() {
  import std.stdio, std.string;
  string[string] replacements = ["test":"passed", "text":"replaces"];
  replacements["foo"] = "bar";
  assert(replacements["test"] == "passed");
  foreach(line; stdin.byLine()) {
    line = line.strip();  // cut off whitespace
    // see if the given line is in the mapping...
    if(auto replacement = line in replacements) {
      // if yes, show the replacement, then unmap it
      // since 'in replacements' returns a pointer to replacements[line]...
      // we must dereference the assigned variable (here it's replacement)
      writeln(line, "=>", *replacement);
      replacements.remove(line.idup);
    } else {
      // if no, add it to the mapping
      writeln(line);
      // 'line.idup' creates an immutable copy of 'line'
      // associative arrays require immutable data
      replacements[line.idup] = "previously inserted!";
    }
  }
  // once user is done entering, display all additions
  // syntax: foreach(index, value; array)
  foreach(line, replacement; replacements)
    writeln("Mapping ", line, " => ", replacement);
}

void arrays() {
  // the 'in' parameter means the parameter is constant and local-only...
  // that is, int[] data gets destoyed at the end of the function
  int sum(in int[] data) {
    int total = 0;
    // also written as: foreach(int item; data)
    foreach(item; data)
      total += item;
    return total;
  }

  int arr[];
  arr ~= 1;
  arr ~= [2,3];
  writeln("The sum of ", arr, " is ", sum(arr));
// arr is a dynamic array, which is a struct with pointer + length properties
  writeln("arr's ptr: 0x", arr.ptr);
  writeln("arr's length: ", arr.length);
}
